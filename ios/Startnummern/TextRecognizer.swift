import Foundation
import ImageIO
import Vision

/// Eine erkannte Textzeile. `height` ist die Höhe relativ zum Bild (0 bis 1),
/// damit lässt sich die größte Zahl finden, meist die Startnummer.
struct OCRLine: Identifiable, Sendable {
    let id = UUID()
    let text: String
    let height: Double
    let confidence: Float
}

/// Apples Texterkennung, läuft komplett auf dem iPhone, ohne Internet und ohne Kosten.
enum TextRecognizer {
    static func recognize(_ data: Data) async throws -> [OCRLine] {
        var request = RecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.recognitionLanguages = [Locale.Language(identifier: "de-DE"), Locale.Language(identifier: "en-US")]
        request.usesLanguageCorrection = false
        let observations = try await request.perform(on: data, orientation: orientation(of: data))
        return observations.compactMap { obs -> OCRLine? in
            guard let best = obs.topCandidates(1).first else { return nil }
            return OCRLine(text: best.string, height: Double(obs.boundingBox.height), confidence: best.confidence)
        }
        .sorted { $0.height > $1.height }
    }

    /// Aufnahmedatum aus den Fotodaten (EXIF).
    static func captureDate(_ data: Data) -> Date? {
        guard let exif = properties(data)?[kCGImagePropertyExifDictionary] as? [CFString: Any],
              let raw = exif[kCGImagePropertyExifDateTimeOriginal] as? String else { return nil }
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return f.date(from: raw)
    }

    private static func properties(_ data: Data) -> [CFString: Any]? {
        guard let src = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        return CGImageSourceCopyPropertiesAtIndex(src, 0, nil) as? [CFString: Any]
    }

    private static func orientation(of data: Data) -> CGImagePropertyOrientation? {
        guard let raw = properties(data)?[kCGImagePropertyOrientation] as? UInt32 else { return nil }
        return CGImagePropertyOrientation(rawValue: raw)
    }
}

/// Was die App aus dem erkannten Text ableitet.
struct BibGuess {
    var raceID: String?
    var distanceIndex: Int?
    var number: String?
    var printedDate: Date?
    var captureDate: Date?
}

/// Einfache Regeln statt KI: Datum filtert die Läufe, Stichwörter der Vorlage finden den Lauf,
/// die größte Zahl ist die Startnummer.
enum BibParser {
    static func guess(lines: [OCRLine], captureDate: Date?) -> BibGuess {
        var g = BibGuess()
        g.captureDate = captureDate
        let all = lines.map { $0.text.uppercased() }.joined(separator: "  ")
        g.printedDate = findDate(in: all)

        // Lauf
        let dateHint = g.printedDate ?? captureDate
        var best: (race: Race, score: Int)?
        for race in Catalog.races {
            var score = race.keywords.filter { all.contains($0) }.count * 2
            if let d = dateHint, abs(race.date.timeIntervalSince(d)) < 3 * 86_400 { score += 3 }
            if score > 0 && score > (best?.score ?? 0) { best = (race, score) }
        }

        // Startnummer: größte Zeile, die wie eine Nummer aussieht (optional ein Buchstabe, dann 2 bis 6 Ziffern)
        var prefixLetter = ""
        for line in lines {
            let t = line.text.uppercased().filter { !$0.isWhitespace }
            guard let first = t.first else { continue }
            let hasLetter = first.isLetter
            let digits = hasLetter ? String(t.dropFirst()) : t
            if (2...6).contains(digits.count) && digits.allSatisfy(\.isNumber) && !(hasLetter && t.count == 1) {
                g.number = digits
                prefixLetter = hasLetter ? String(first) : ""
                break
            }
        }

        if let race = best?.race {
            g.raceID = race.id
            if race.distances.count == 1 {
                g.distanceIndex = 0
            } else if !prefixLetter.isEmpty, let i = race.distances.firstIndex(where: { $0.prefix == prefixLetter }) {
                g.distanceIndex = i
            } else {
                // das längste passende Stichwort gewinnt (HALBMARATHON vor MARATHON)
                let hits = race.distances.enumerated().compactMap { i, d -> (Int, Int)? in
                    let len = d.keywords.filter { all.contains($0) }.map(\.count).max()
                    return len.map { (i, $0) }
                }
                g.distanceIndex = hits.max { $0.1 < $1.1 }?.0
            }
        }
        return g
    }

    private static func findDate(in text: String) -> Date? {
        guard let re = try? NSRegularExpression(pattern: "(\\d{1,2})\\.(\\d{1,2})\\.(\\d{2,4})") else { return nil }
        let ns = text as NSString
        for m in re.matches(in: text, range: NSRange(location: 0, length: ns.length)) {
            guard let d = Int(ns.substring(with: m.range(at: 1))),
                  let mo = Int(ns.substring(with: m.range(at: 2))),
                  var y = Int(ns.substring(with: m.range(at: 3))) else { continue }
            if y < 100 { y += 2000 }
            if (1...31).contains(d), (1...12).contains(mo) { return Catalog.day(y, mo, d) }
        }
        return nil
    }
}
