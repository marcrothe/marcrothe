import CoreText
import SwiftUI
import UIKit

// MARK: Schriften

enum BibFont {
    /// Registriert alle Schriften im Ordner Fonts (ttf, otf), ohne Info.plist Eintrag.
    static func registerAll() {
        let urls = (Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: nil) ?? [])
            + (Bundle.main.urls(forResourcesWithExtension: "otf", subdirectory: nil) ?? [])
        for url in urls {
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }

    static let hnName = "HelveticaNeueLTStd-BlkEx"

    /// HN Black Ext, falls die Datei im Projekt liegt, sonst breite Systemschrift.
    static func hn(_ size: CGFloat) -> Font {
        UIFont(name: hnName, size: size) != nil ? .custom(hnName, fixedSize: size) : .system(size: size, weight: .black).width(.expanded)
    }

    static func work(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        UIFont(name: "WorkSans-Regular", size: size) != nil ? .custom("Work Sans", fixedSize: size).weight(weight) : .system(size: size, weight: weight)
    }

    static func barlow(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        let name = weight == .bold ? "BarlowCondensed-Bold" : (weight == .semibold ? "BarlowCondensed-SemiBold" : "BarlowCondensed-Medium")
        return UIFont(name: name, size: size) != nil ? .custom(name, fixedSize: size) : .system(size: size, weight: weight).width(.condensed)
    }
}

// MARK: Startnummer

/// Zeigt eine Startnummer genau wie im Entwurf: Die Grafik der Vorlage kommt als Bild aus dem
/// Entwurf (Logo, Farben, Löcher), nur Nummer, Name, Strecke und Zeit werden darüber gesetzt.
/// Alle Maße sind Einheiten der 108 breiten Vorlage und werden mit `u` skaliert.
struct BibView: View {
    let bib: Bib
    var back = false
    /// Neigung der Karte auf dem Bildschirm in Grad, damit der Glanz immer gleich steht.
    var tilt: Double = 0

    static func designHeight(_ template: String?) -> CGFloat {
        switch template {
        case "kh", "khm": return 92
        case "dm": return 72
        default: return 76
        }
    }

    private var template: String? { bib.distance.template }
    private var imageKey: String? {
        guard let t = template else { return nil }
        let base = t == "khm" ? "kh" : t
        return "bib-\(base)-\(back ? "back" : "front")"
    }

    var body: some View {
        let h = Self.designHeight(template)
        GeometryReader { g in
            let u = g.size.width / 108
            ZStack {
                if let key = imageKey {
                    Image(key).resizable().interpolation(.high)
                    if back {
                        BackText(bib: bib, u: u, h: h)
                    } else {
                        FrontText(bib: bib, u: u)
                    }
                    Color.clear
                        .overlay { Gloss(u: u, tilt: tilt) }
                        .mask(Image(key).resizable())
                        .allowsHitTesting(false)
                } else {
                    GlassPlate(u: u, h: h)
                }
            }
            .frame(width: g.size.width, height: g.size.height)
            .overlay {
                if bib.favorite && template != nil {
                    // 1 Punkt Holo Rand genau entlang der Papierkante, halbe Stärke
                    RoundedRectangle(cornerRadius: 1.6 * u)
                        .strokeBorder(Holo.angular, lineWidth: 1)
                        .opacity(0.5)
                }
            }
        }
        .aspectRatio(108 / h, contentMode: .fit)
    }
}

/// Text an eine Grundlinie der Vorlage setzen. `x`, `baseline` wie im SVG, `anchor` wie text-anchor.
private struct Placed: View {
    let text: String
    let font: Font
    let color: Color
    var kerning: CGFloat = 0
    let u: CGFloat
    let x: CGFloat
    let baseline: CGFloat
    let size: CGFloat
    var anchor: HorizontalAlignment = .center
    var box: CGFloat = 100
    /// true: bei kleinerer Schrift bleibt die Mitte stehen (Nummern), false: die Grundlinie
    var keepCenter = false

    var body: some View {
        let w = box * u
        let cx: CGFloat = anchor == .center ? x : (anchor == .leading ? x + box / 2 : x - box / 2)
        Text(text)
            .font(font)
            .kerning(kerning * u)
            .foregroundStyle(color)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
            .frame(width: w, alignment: anchor == .center ? .center : (anchor == .leading ? .leading : .trailing))
            .position(x: cx * u, y: (baseline - (keepCenter ? 0.36 : 0.34) * size) * u)
    }
}

/// Variable Texte auf der Vorderseite.
private struct FrontText: View {
    let bib: Bib
    let u: CGFloat

    var body: some View {
        switch bib.distance.template {
        case "kh", "khm":
            let mar = bib.distance.template == "khm"
            let one = "Europäischer Kulturhauptstadt-\(mar ? "Marathon" : "Halbmarathon")  |  Chemnitz, 18. Mai 2025  |  "
            ZStack {
                ForEach([38.6, 69.2], id: \.self) { y in
                    Text(one + one)
                        .font(BibFont.work(2.2 * u, .semibold))
                        .kerning(0.044 * u)
                        .foregroundStyle(Color(hex: 0xFFD9DE))
                        .lineLimit(1)
                        .fixedSize()
                        .frame(width: 102 * u)
                        .clipped()
                        .position(x: 54 * u, y: (y - 0.75) * u)
                }
                Placed(text: bib.fullNumber, font: BibFont.work(28.2 * u, .bold), color: Color(hex: 0xEEEEF0), kerning: 0.282,
                       u: u, x: 54, baseline: 62.4, size: 28.2, box: 94, keepCenter: true)
                Placed(text: mar ? "Marathon" : "Halbmarathon", font: BibFont.barlow(6 * u, .bold), color: Color(hex: 0x1D5FB0), kerning: 0.6,
                       u: u, x: 12, baseline: 84, size: 6, anchor: .leading, box: 40)
            }
        case "cl":
            ZStack {
                Placed(text: bib.runner.uppercased(), font: BibFont.work(26.1 * u, .bold), color: Color(hex: 0x141414), kerning: -0.261,
                       u: u, x: 55, baseline: 44, size: 26.1, box: 84, keepCenter: true)
                Placed(text: bib.fullNumber, font: BibFont.work(8.6 * u, .bold), color: Color(hex: 0x141414), kerning: 0.172,
                       u: u, x: 55, baseline: 55.5, size: 8.6, box: 40)
            }
        case "dm":
            ZStack {
                Placed(text: bib.fullNumber, font: BibFont.barlow(36.6 * u, .semibold), color: Color(hex: 0x262626), kerning: -0.366,
                       u: u, x: 56, baseline: 45, size: 36.6, box: 74, keepCenter: true)
                Placed(text: bib.runner, font: BibFont.work(6.4 * u, .regular), color: Color(hex: 0x5C5C5C),
                       u: u, x: 56, baseline: 53.5, size: 6.4, box: 60)
            }
        default:
            EmptyView()
        }
    }
}

/// Rückseite: bei allen Startnummern gleich, Block mittig.
private struct BackText: View {
    let bib: Bib
    let u: CGFloat
    let h: CGFloat

    var body: some View {
        let c = h / 2 - 3
        let navy = Color(hex: 0x060437)
        let title = bib.distance.template == "cl" ? bib.race.name : "\(bib.distance.label) \(bib.race.city)"
        ZStack {
            if bib.favorite {
                Image(systemName: "star.fill")
                    .font(.system(size: 8 * u))
                    .foregroundStyle(LinearGradient(colors: [Color(hex: 0x4FB7E8), Color(hex: 0x7D49FF), Color(hex: 0xE0459E), Color(hex: 0xF2A900)], startPoint: .leading, endPoint: .trailing))
                    .position(x: 54 * u, y: (c - 22) * u)
            }
            Placed(text: title, font: BibFont.hn(4.6 * u), color: navy, kerning: 0.05, u: u, x: 54, baseline: c - 12, size: 4.6, box: 96)
            Placed(text: bib.timeText ?? "", font: BibFont.hn(19 * u), color: navy, u: u, x: 54, baseline: c + 9, size: 19, box: 92, keepCenter: true)
            Placed(text: bib.timeText == nil ? "Zeit noch offen" : "offizielle Zeit", font: BibFont.work(5.4 * u, .medium), color: Color(hex: 0x8A8A99),
                   u: u, x: 54, baseline: c + 21, size: 5.4, box: 96)
        }
    }
}

/// Glanz: schräger Lichtstreifen mit höchstens 10 Prozent Weiß. Sein Winkel bleibt auf dem
/// Bildschirm gleich (Gegendrehung um `tilt`), das Licht fällt also immer gleich ein.
struct Gloss: View {
    let u: CGFloat
    var tilt: Double = 0
    var shift: CGFloat = -24

    var body: some View {
        LinearGradient(
            stops: [.init(color: .white.opacity(0), location: 0), .init(color: .white.opacity(0.10), location: 0.5), .init(color: .white.opacity(0), location: 1)],
            startPoint: UnitPoint(x: 22 / 108, y: 0), endPoint: UnitPoint(x: 86 / 108, y: 34 / 92)
        )
        .frame(width: 324 * u, height: 276 * u)
        .offset(x: shift * u)
        .rotationEffect(.degrees(-tilt))
    }
}

enum Holo {
    static let colors: [Color] = [Color(hex: 0x92D6F3), Color(hex: 0x7D49FF), Color(hex: 0x04F8CC), Color(hex: 0xFB5FBB), Color(hex: 0xFFD65A), Color(hex: 0x92D6F3)]
    static let angular = AngularGradient(colors: colors, center: .center)
    /// zarte, fast weiße Holo Schrift für Favoriten
    static let soft = LinearGradient(colors: [Color(hex: 0xE3F4FC), .white, Color(hex: 0xECE4FF), Color(hex: 0xDCFFF6)], startPoint: .leading, endPoint: .trailing)
    /// bunter Wisch über die Startnummer beim Favorisieren
    static let sweep = LinearGradient(stops: [
        .init(color: .white.opacity(0), location: 0.18),
        .init(color: Color(hex: 0x92D6F3, opacity: 0.85), location: 0.30),
        .init(color: Color(hex: 0x7D49FF, opacity: 0.75), location: 0.40),
        .init(color: Color(hex: 0x04F8CC, opacity: 0.80), location: 0.50),
        .init(color: Color(hex: 0xFB5FBB, opacity: 0.70), location: 0.60),
        .init(color: Color(hex: 0xFFD65A, opacity: 0.65), location: 0.68),
        .init(color: .white.opacity(0), location: 0.82),
    ], startPoint: .leading, endPoint: .trailing)
}

/// Klare Glasplatte mit vier Löchern, Platzhalter solange keine Vorlage da ist.
struct GlassPlate: View {
    let u: CGFloat
    let h: CGFloat

    var body: some View {
        let edge = LinearGradient(colors: [.white.opacity(0.42), .white.opacity(0.14), .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
        ZStack {
            LinearGradient(colors: [.white.opacity(0.12), .white.opacity(0.05), .white.opacity(0.09)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .overlay { Gloss(u: u, shift: -24).opacity(1.4) }
            .clipped()
            .mask {
                ZStack {
                    RoundedRectangle(cornerRadius: 2.4 * u)
                    ForEach(0..<4, id: \.self) { i in
                        Circle().frame(width: 3.8 * u, height: 3.8 * u)
                            .position(x: (i % 2 == 0 ? 5.5 : 102.5) * u, y: (i < 2 ? 5.5 : h - 5.5) * u)
                            .blendMode(.destinationOut)
                    }
                }
                .compositingGroup()
            }
            RoundedRectangle(cornerRadius: 2.4 * u).strokeBorder(edge, lineWidth: 0.6)
            ForEach(0..<4, id: \.self) { i in
                Circle().strokeBorder(edge, lineWidth: 0.5)
                    .frame(width: 3.8 * u, height: 3.8 * u)
                    .position(x: (i % 2 == 0 ? 5.5 : 102.5) * u, y: (i < 2 ? 5.5 : h - 5.5) * u)
            }
        }
    }
}

/// Startnummer zum Umdrehen per Antippen.
struct FlipBib: View {
    let bib: Bib
    @State private var flipped = false

    var body: some View {
        FlipCard(bib: bib, flipped: flipped)
            .onTapGesture { flipped.toggle() }
            .accessibilityLabel("\(bib.race.name), \(bib.fullNumber)")
            .accessibilityHint("Doppeltippen zum Umdrehen")
    }
}

#Preview {
    VStack(spacing: 24) {
        BibView(bib: BibStore().bibs[0]).frame(width: 300)
        BibView(bib: BibStore().bibs[1]).frame(width: 300)
        BibView(bib: BibStore().bibs[2], back: true).frame(width: 300)
    }
    .padding()
    .background(Color.black)
    .onAppear { BibFont.registerAll() }
}
