import Foundation
import Observation

/// Wie der Name auf einer Vorlage erscheint.
enum NameStyle: Hashable {
    case none, upper, normal
}

/// Eine Strecke eines Laufs. `template` ist die Vorlage für das Design, nil heißt: Vorlage folgt noch.
struct Distance: Hashable {
    let label: String
    let km: Double
    let category: String // "5k", "10k", "hm", "m" oder "other"
    let template: String?
    let prefix: String
    let numberPlaceholder: String
    let keywords: [String]
}

struct Race: Identifiable, Hashable {
    let id: String
    let name: String
    let city: String
    let date: Date
    let keywords: [String]
    let nameOnBib: NameStyle
    let distances: [Distance]
}

enum Catalog {
    static func day(_ y: Int, _ m: Int, _ d: Int) -> Date {
        Calendar.current.date(from: DateComponents(year: y, month: m, day: d)) ?? .now
    }

    static let races: [Race] = [
        Race(
            id: "kh", name: "Europäischer Kulturhauptstadt-Marathon", city: "Chemnitz",
            date: day(2025, 5, 18), keywords: ["KULTURHAUPTSTADT", "CHEMNITZ"], nameOnBib: .none,
            distances: [
                Distance(label: "Halbmarathon", km: 21.1, category: "hm", template: "kh", prefix: "H", numberPlaceholder: "6943", keywords: ["HALBMARATHON"]),
                Distance(label: "Marathon", km: 42.195, category: "m", template: "khm", prefix: "M", numberPlaceholder: "1207", keywords: ["MARATHON"]),
            ]
        ),
        Race(
            id: "cl", name: "Citylauf Dresden", city: "Dresden",
            date: day(2025, 3, 23), keywords: ["CITYLAUF"], nameOnBib: .upper,
            distances: [
                Distance(label: "5 km Lauf", km: 5, category: "5k", template: "cl", prefix: "", numberPlaceholder: "3228", keywords: ["5 KM"]),
            ]
        ),
        Race(
            id: "dm", name: "Dresden Marathon", city: "Dresden",
            date: day(2024, 10, 27), keywords: ["DRESDEN MARATHON", "DRESDEN-MARATHON"], nameOnBib: .normal,
            distances: [
                Distance(label: "Marathon", km: 42.195, category: "m", template: nil, prefix: "", numberPlaceholder: "1234", keywords: ["MARATHON"]),
                Distance(label: "Halbmarathon", km: 21.1, category: "hm", template: nil, prefix: "", numberPlaceholder: "1234", keywords: ["HALBMARATHON"]),
                Distance(label: "Viertelmarathon", km: 10.55, category: "other", template: "dm", prefix: "", numberPlaceholder: "10739", keywords: ["VIERTEL"]),
            ]
        ),
    ]

    static func race(_ id: String) -> Race? { races.first { $0.id == id } }

    static func races(on date: Date) -> [Race] {
        races.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
}

struct Bib: Identifiable, Hashable {
    let id: UUID
    var raceID: String
    var distanceIndex: Int
    var number: String // nur Ziffern
    var runner: String
    var seconds: Int? // offizielle Zeit
    var favorite: Bool

    init(id: UUID = UUID(), raceID: String, distanceIndex: Int, number: String, runner: String, seconds: Int?, favorite: Bool = false) {
        self.id = id
        self.raceID = raceID
        self.distanceIndex = distanceIndex
        self.number = number
        self.runner = runner
        self.seconds = seconds
        self.favorite = favorite
    }

    var race: Race { Catalog.race(raceID) ?? Catalog.races[0] }
    var distance: Distance { race.distances[min(distanceIndex, race.distances.count - 1)] }
    var fullNumber: String { number.isEmpty ? "" : distance.prefix + number }
    var timeText: String? { seconds.map(TimeFormat.string) }

    /// Zeile unter der Startnummer, wie in der Sammlung.
    var line: String {
        "\(race.date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year())) | \(TimeFormat.km(distance.km)) km"
    }
}

enum TimeFormat {
    static func string(_ s: Int) -> String {
        let h = s / 3600, m = (s % 3600) / 60, sec = s % 60
        return h > 0 ? String(format: "%d:%02d:%02d", h, m, sec) : String(format: "%d:%02d", m, sec)
    }

    /// 5 → "5", 21.1 → "21,1", 42.195 → "42,195"
    static func km(_ v: Double) -> String {
        var s = String(format: "%.3f", v)
        while s.hasSuffix("0") { s.removeLast() }
        if s.hasSuffix(".") { s.removeLast() }
        return s.replacingOccurrences(of: ".", with: ",")
    }
}

@Observable
final class BibStore {
    static let profileName = "Marc"

    var bibs: [Bib] = [
        Bib(raceID: "kh", distanceIndex: 0, number: "6943", runner: "Marc", seconds: 1 * 3600 + 29 * 60 + 17),
        Bib(raceID: "cl", distanceIndex: 0, number: "3228", runner: "Marc", seconds: 18 * 60 + 54, favorite: true),
        Bib(raceID: "dm", distanceIndex: 2, number: "10739", runner: "Marc", seconds: 40 * 60 + 19),
    ]

    var sortedByDate: [Bib] { bibs.sorted { $0.race.date > $1.race.date } }

    func add(_ bib: Bib) { bibs.append(bib) }

    func update(_ bib: Bib) {
        if let i = bibs.firstIndex(where: { $0.id == bib.id }) { bibs[i] = bib }
    }

    func delete(_ bib: Bib) { bibs.removeAll { $0.id == bib.id } }

    func toggleFavorite(_ bib: Bib) {
        if let i = bibs.firstIndex(where: { $0.id == bib.id }) { bibs[i].favorite.toggle() }
    }
}
