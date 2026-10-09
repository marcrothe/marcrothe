import SwiftUI

/// Zeichnet eine Startnummer nach ihrer Vorlage. Alle Maße sind in Einheiten der 108 breiten
/// Vorlage angegeben (wie in den Entwürfen) und werden mit `u` auf die echte Breite skaliert.
struct BibView: View {
    let bib: Bib
    var back = false

    static func designHeight(_ template: String?) -> CGFloat {
        switch template {
        case "kh", "khm": return 92
        case "dm": return 72
        default: return 76
        }
    }

    var body: some View {
        let h = Self.designHeight(bib.distance.template)
        GeometryReader { g in
            let u = g.size.width / 108
            ZStack {
                if back {
                    BackFace(bib: bib, u: u, h: h)
                } else {
                    switch bib.distance.template {
                    case "kh", "khm": KHFront(bib: bib, u: u)
                    case "cl": CLFront(bib: bib, u: u)
                    case "dm": DMFront(bib: bib, u: u)
                    default: GlassPlate(u: u, h: h)
                    }
                }
            }
            .frame(width: g.size.width, height: g.size.height)
            .overlay { if bib.distance.template != nil || back { PunchHoles(u: u, h: h) } }
            .clipShape(RoundedRectangle(cornerRadius: 1.6 * u))
            .overlay {
                if bib.favorite {
                    RoundedRectangle(cornerRadius: 1.6 * u)
                        .strokeBorder(Holo.angular, lineWidth: max(1, 0.45 * u))
                        .opacity(0.6)
                }
            }
        }
        .aspectRatio(108 / h, contentMode: .fit)
    }
}

enum Holo {
    static let colors: [Color] = [Color(hex: 0x92D6F3), Color(hex: 0x7D49FF), Color(hex: 0x04F8CC), Color(hex: 0xFB5FBB), Color(hex: 0xFFD65A), Color(hex: 0x92D6F3)]
    static let angular = AngularGradient(colors: colors, center: .center)
    /// zarte, fast weiße Holo Schrift für Favoriten
    static let soft = LinearGradient(colors: [Color(hex: 0xE3F4FC), .white, Color(hex: 0xECE4FF), Color(hex: 0xDCFFF6)], startPoint: .leading, endPoint: .trailing)
}

/// Vier Löcher für die Sicherheitsnadeln.
struct PunchHoles: View {
    let u: CGFloat
    let h: CGFloat

    var body: some View {
        ZStack {
            ForEach(0..<4, id: \.self) { i in
                Circle()
                    .fill(Color.black)
                    .frame(width: 3.4 * u, height: 3.4 * u)
                    .position(x: (i % 2 == 0 ? 5.5 : 102.5) * u, y: (i < 2 ? 5.5 : h - 5.5) * u)
            }
        }
    }
}

/// Text, der in ein Feld fester Breite passt und bei Bedarf kleiner wird.
private struct FitText: View {
    let text: String
    let size: CGFloat
    var weight: Font.Weight = .bold
    var width: Font.Width = .standard
    var color: Color
    let box: CGFloat
    var alignment: Alignment = .center

    var body: some View {
        Text(text)
            .font(.system(size: size, weight: weight).width(width))
            .foregroundStyle(color)
            .lineLimit(1)
            .minimumScaleFactor(0.25)
            .frame(width: box, alignment: alignment)
    }
}

// MARK: Vorlagen

/// Europäischer Kulturhauptstadt-Marathon Chemnitz 2025 (Halbmarathon und Marathon).
struct KHFront: View {
    let bib: Bib
    let u: CGFloat

    private var isMarathon: Bool { bib.distance.template == "khm" }
    private var band: String {
        let one = "Europäischer Kulturhauptstadt-\(isMarathon ? "Marathon" : "Halbmarathon")  |  Chemnitz, 18. Mai 2025  |  "
        return one + one + one
    }

    var body: some View {
        let red = Color(hex: 0xD7193F), blue = Color(hex: 0x1F5FB0)
        ZStack {
            Color(hex: 0xF5F5F0)
            // Logo Ersatz: bunte Striche
            HStack(alignment: .bottom, spacing: 1.4 * u) {
                ForEach(0..<6, id: \.self) { i in
                    Capsule()
                        .fill([red, blue, Color(hex: 0xF2A900), Color(hex: 0x2E9E5B), red, blue][i])
                        .frame(width: 2.2 * u, height: CGFloat([10, 15, 12, 17, 9, 13][i]) * u)
                }
            }
            .position(x: 25 * u, y: 21 * u)

            Rectangle().fill(red).frame(width: 102 * u, height: 5.5 * u).position(x: 54 * u, y: 37.75 * u)
            Rectangle().fill(blue).frame(width: 102 * u, height: 25.5 * u).position(x: 54 * u, y: 53.25 * u)
            Rectangle().fill(red).frame(width: 102 * u, height: 5.5 * u).position(x: 54 * u, y: 68.75 * u)
            bandText.position(x: 54 * u, y: 37.9 * u)
            bandText.position(x: 54 * u, y: 68.6 * u)

            FitText(text: bib.fullNumber, size: 28.2 * u, weight: .bold, color: Color(hex: 0xEEEEF0), box: 94 * u)
                .position(x: 54 * u, y: 53.5 * u)

            Rectangle().fill(Color(hex: 0xC9C9CF)).frame(width: 84 * u, height: 0.4 * u).position(x: 54 * u, y: 76 * u)
            FitText(text: bib.distance.label, size: 6 * u, weight: .bold, width: .condensed, color: Color(hex: 0x1D5FB0), box: 42 * u, alignment: .leading)
                .position(x: 33 * u, y: 82 * u)
            FitText(text: "Chemnitz 2025", size: 6 * u, weight: .bold, width: .condensed, color: Color(hex: 0xC8102E), box: 42 * u, alignment: .trailing)
                .position(x: 75 * u, y: 82 * u)
        }
    }

    private var bandText: some View {
        Text(band)
            .font(.system(size: 2.2 * u, weight: .semibold))
            .foregroundStyle(Color(hex: 0xFFD9DE))
            .lineLimit(1)
            .fixedSize()
            .frame(width: 102 * u)
            .clipped()
    }
}

/// Citylauf Dresden 2025.
struct CLFront: View {
    let bib: Bib
    let u: CGFloat

    var body: some View {
        ZStack {
            Color.white
            Rectangle().fill(Color(hex: 0xF0A93A)).frame(width: 53 * u, height: 17 * u).position(x: 81.5 * u, y: 8.5 * u)
            LinearGradient(colors: [Color(hex: 0xF3B451), Color(hex: 0xFCE7B8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 108 * u, height: 41 * u)
                .position(x: 54 * u, y: 38 * u)
            Rectangle().fill(Color(hex: 0x1A1A1A)).frame(width: 108 * u, height: 0.8 * u).position(x: 54 * u, y: 17.4 * u)
            Rectangle().fill(Color(hex: 0x1A1A1A)).frame(width: 108 * u, height: 0.8 * u).position(x: 54 * u, y: 58.6 * u)

            VStack(alignment: .leading, spacing: 0.3 * u) {
                Text("CITYLAUF").font(.system(size: 5 * u, weight: .heavy).width(.condensed)).foregroundStyle(Color(hex: 0x1A1A1A))
                Text("DRESDEN").font(.system(size: 3.2 * u, weight: .bold)).kerning(0.6 * u).foregroundStyle(Color(hex: 0xF0A93A))
            }
            .frame(width: 45 * u, alignment: .leading)
            .position(x: 33 * u, y: 9 * u)
            Text("23.3.25").font(.system(size: 8 * u, weight: .heavy)).foregroundStyle(.white)
                .frame(width: 45 * u, alignment: .trailing)
                .position(x: 77 * u, y: 8.8 * u)

            FitText(text: bib.runner.uppercased(), size: 26.1 * u, weight: .heavy, color: Color(hex: 0x141414), box: 84 * u)
                .position(x: 55 * u, y: 35 * u)
            FitText(text: bib.fullNumber, size: 8.6 * u, weight: .bold, color: Color(hex: 0x141414), box: 40 * u)
                .position(x: 55 * u, y: 52.5 * u)
            Text("5 km Lauf").font(.system(size: 3.4 * u, weight: .semibold)).foregroundStyle(Color(hex: 0x141414))
                .fixedSize()
                .rotationEffect(.degrees(-90))
                .position(x: 7 * u, y: 38 * u)
            Circle().fill(Color(hex: 0x1F9A4A)).frame(width: 6.2 * u).position(x: 93 * u, y: 51 * u)

            ForEach(0..<3, id: \.self) { i in
                VStack(spacing: 1.2 * u) {
                    Rectangle().frame(width: 20 * u, height: 0.5 * u)
                    Rectangle().frame(width: 20 * u, height: 0.5 * u)
                }
                .foregroundStyle(Color(hex: 0x9A9AA0))
                .position(x: CGFloat(20 + i * 34) * u, y: 66.5 * u)
            }
        }
    }
}

/// 24. Dresden Marathon 2024, Viertelmarathon.
struct DMFront: View {
    let bib: Bib
    let u: CGFloat

    var body: some View {
        ZStack {
            Color(hex: 0xF7F7F2)
            Rectangle().fill(Color(hex: 0xF2B705)).frame(width: 108 * u, height: 13 * u).position(x: 54 * u, y: 6.5 * u)
            Text("24. Dresden Marathon").font(.system(size: 6 * u, weight: .bold).width(.condensed)).foregroundStyle(Color(hex: 0x3A2A00))
                .position(x: 56 * u, y: 5.6 * u)
            Text("Sonntag, 27. Oktober 2024").font(.system(size: 3 * u, weight: .medium).width(.condensed)).foregroundStyle(Color(hex: 0x3A2A00))
                .position(x: 56 * u, y: 10.6 * u)
            Path { p in
                p.move(to: CGPoint(x: 92 * u, y: 13 * u))
                p.addLine(to: CGPoint(x: 108 * u, y: 13 * u))
                p.addLine(to: CGPoint(x: 108 * u, y: 46 * u))
                p.closeSubpath()
            }
            .fill(Color(hex: 0x9C9EA6))
            Text("B").font(.system(size: 6 * u, weight: .bold).width(.condensed)).foregroundStyle(Color(hex: 0x262626))
                .position(x: 101 * u, y: 18.5 * u)
            ForEach(0..<3, id: \.self) { i in
                Rectangle().fill(Color(hex: 0x8C8C8C)).frame(width: 0.6 * u, height: 32 * u).position(x: CGFloat(6 + Double(i) * 1.6) * u, y: 34 * u)
            }
            FitText(text: bib.fullNumber, size: 36.6 * u, weight: .semibold, width: .condensed, color: Color(hex: 0x262626), box: 74 * u)
                .position(x: 56 * u, y: 32 * u)
            FitText(text: bib.runner, size: 6.4 * u, weight: .regular, color: Color(hex: 0x5C5C5C), box: 60 * u)
                .position(x: 56 * u, y: 51 * u)
            Rectangle().fill(Color(hex: 0x2F7A4C)).frame(width: 108 * u, height: 16 * u).position(x: 54 * u, y: 64 * u)
            Text("Viertelmarathon 10,55 km").font(.system(size: 7 * u, weight: .bold).width(.condensed)).foregroundStyle(.white)
                .position(x: 54 * u, y: 64 * u)
        }
    }
}

/// Rückseite: bei allen Startnummern gleich.
struct BackFace: View {
    let bib: Bib
    let u: CGFloat
    let h: CGFloat

    var body: some View {
        let navy = Color(hex: 0x060437)
        ZStack {
            Color(hex: 0xF2F2EE)
            if bib.favorite {
                Image(systemName: "star.fill")
                    .font(.system(size: 6 * u))
                    .foregroundStyle(LinearGradient(colors: Holo.colors, startPoint: .leading, endPoint: .trailing))
                    .position(x: 54 * u, y: 10 * u)
            }
            VStack(spacing: 3.5 * u) {
                FitText(text: "\(bib.distance.label == "5 km Lauf" ? bib.race.name : "\(bib.distance.label) \(bib.race.city)")", size: 4.6 * u, weight: .black, width: .expanded, color: navy, box: 96 * u)
                FitText(text: bib.timeText ?? " ", size: 19 * u, weight: .black, width: .expanded, color: navy, box: 92 * u)
                Text(bib.timeText == nil ? "Zeit noch offen" : "offizielle Zeit")
                    .font(.system(size: 5.4 * u, weight: .medium))
                    .foregroundStyle(Color.bibGrey)
            }
            .position(x: 54 * u, y: (h / 2 + 2) * u)
        }
    }
}

/// Klare Glasplatte mit vier Löchern, Platzhalter solange keine Vorlage da ist.
struct GlassPlate: View {
    let u: CGFloat
    let h: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2.4 * u)
                .fill(LinearGradient(colors: [.white.opacity(0.12), .white.opacity(0.05), .white.opacity(0.09)], startPoint: .topLeading, endPoint: .bottomTrailing))
            LinearGradient(colors: [.clear, .white.opacity(0.14), .clear], startPoint: UnitPoint(x: 0.1, y: 0), endPoint: UnitPoint(x: 0.6, y: 0.6))
            RoundedRectangle(cornerRadius: 2.4 * u)
                .strokeBorder(LinearGradient(colors: [.white.opacity(0.42), .white.opacity(0.14), .white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.6)
            ForEach(0..<4, id: \.self) { i in
                Circle()
                    .strokeBorder(.white.opacity(0.3), lineWidth: 0.5)
                    .background(Circle().fill(Color.black))
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
        ZStack {
            BibView(bib: bib)
                .opacity(flipped ? 0 : 1)
            BibView(bib: bib, back: true)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .opacity(flipped ? 1 : 0)
        }
        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0), perspective: 0.4)
        .animation(.spring(duration: 0.6), value: flipped)
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
}
