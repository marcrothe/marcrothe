import SwiftUI

/// Erfolge: Bestzeiten als Startnummern im Raster, darunter drei ruhige Zahlen.
struct AchievementsView: View {
    @Environment(BibStore.self) private var store

    private let categories: [(key: String, label: String)] = [("5k", "5K"), ("10k", "10K"), ("hm", "HALBMARATHON"), ("m", "MARATHON")]

    private func best(_ key: String) -> Bib? {
        store.bibs
            .filter { $0.distance.category == key && $0.seconds != nil }
            .min { ($0.seconds ?? 0) < ($1.seconds ?? 0) }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Bestzeiten")
                        .font(.system(size: 18, weight: .black).width(.expanded))
                        .foregroundStyle(Color.bibGrey)
                        .padding(.top, 8)

                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 18), GridItem(.flexible())], spacing: 28) {
                        ForEach(categories, id: \.key) { cat in
                            VStack(spacing: 12) {
                                Text(cat.label)
                                    .font(.caption.weight(.semibold))
                                    .kerning(0.7)
                                    .foregroundStyle(Color.bibGrey)
                                Group {
                                    if let bib = best(cat.key) {
                                        FlipBib(bib: bib)
                                    } else {
                                        GeometryReader { g in GlassPlate(u: g.size.width / 108, h: 76) }
                                            .aspectRatio(108 / 76, contentMode: .fit)
                                    }
                                }
                                .frame(width: 150)
                                .frame(height: 130)
                                Text(best(cat.key).map { "\($0.timeText ?? "") | \($0.race.city)" } ?? "noch offen")
                                    .font(.caption.weight(.semibold))
                                    .foregroundStyle(best(cat.key) == nil ? Color(hex: 0x5A5A66) : Color.bibGrey)
                            }
                        }
                    }

                    HStack {
                        stat("\(store.bibs.count)", "Startnummern")
                        stat(TimeFormat.km((store.bibs.reduce(0) { $0 + $1.distance.km } * 10).rounded() / 10), "Wettkampf km")
                        stat("\(Set(store.bibs.map(\.race.city)).count)", "Städte")
                    }
                    .padding(.top, 40)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
            .navigationTitle("Erfolge")
        }
    }

    private func stat(_ value: String, _ label: String) -> some View {
        VStack(spacing: 8) {
            Text(value).font(.system(size: 26, weight: .black).width(.expanded))
            Text(label).font(.caption.weight(.semibold)).foregroundStyle(Color.bibGrey)
        }
        .frame(maxWidth: .infinity)
    }
}
