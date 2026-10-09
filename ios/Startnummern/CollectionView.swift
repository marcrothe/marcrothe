import SwiftUI

enum SortMode: String, CaseIterable, Identifiable {
    case date = "Datum", favorites = "Favoriten", category = "Laufkategorie", km = "Kilometer"
    var id: String { rawValue }
}

struct CollectionView: View {
    @Environment(BibStore.self) private var store
    @State private var mode: SortMode = .date
    @State private var editing: Bib?

    private struct BibGroup: Identifiable {
        let id: String
        let title: String
        let bibs: [Bib]
    }

    private var groups: [BibGroup] {
        switch mode {
        case .date:
            let byYear = Dictionary(grouping: store.sortedByDate) { Calendar.current.component(.year, from: $0.race.date) }
            return byYear.keys.sorted(by: >).map { y in BibGroup(id: "\(y)", title: "\(y)", bibs: byYear[y] ?? []) }
        case .favorites:
            return [BibGroup(id: "fav", title: "", bibs: store.sortedByDate.filter(\.favorite))]
        case .category:
            let order = ["5k", "10k", "hm", "m", "other"]
            let names = ["5k": "5k", "10k": "10k", "hm": "21k", "m": "42k", "other": "Weitere"]
            let byCat = Dictionary(grouping: store.sortedByDate) { $0.distance.category }
            return order.compactMap { c in byCat[c].map { BibGroup(id: c, title: names[c] ?? c, bibs: $0) } }
        case .km:
            return [BibGroup(id: "km", title: "", bibs: store.bibs.sorted { $0.distance.km > $1.distance.km })]
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    if mode == .favorites && groups.first?.bibs.isEmpty == true {
                        Text("Noch keine Favoriten.\nTippe lange auf eine Startnummer.")
                            .font(.footnote.weight(.medium))
                            .foregroundStyle(Color.bibGrey)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 40)
                    }
                    ForEach(groups) { group in
                        if !group.title.isEmpty {
                            HStack(alignment: .firstTextBaseline) {
                                Text(group.title)
                                    .font(.system(size: 18, weight: .black).width(.expanded))
                                    .foregroundStyle(Color.bibGrey)
                                Spacer()
                                Text("\(group.bibs.count) \(group.bibs.count == 1 ? "Startnummer" : "Startnummern")")
                                    .font(.caption.weight(.medium))
                                    .foregroundStyle(Color.bibGrey)
                            }
                        }
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 18), GridItem(.flexible())], spacing: 28) {
                            ForEach(group.bibs) { bib in
                                BibCell(bib: bib, onEdit: { editing = bib })
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
            .navigationTitle("Sammlung")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Sortieren nach", selection: $mode) {
                            ForEach(SortMode.allCases) { m in Text(m.rawValue).tag(m) }
                        }
                    } label: {
                        Label(mode.rawValue, systemImage: "line.3.horizontal.decrease")
                    }
                }
            }
            .sheet(item: $editing) { bib in
                AddView(editing: bib)
            }
        }
    }
}

struct BibCell: View {
    @Environment(BibStore.self) private var store
    let bib: Bib
    var width: CGFloat = 150
    let onEdit: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            FlipBib(bib: bib)
                .frame(width: width)
                .frame(height: 130)
                .contextMenu {
                    Button(bib.favorite ? "Aus Favoriten entfernen" : "Zu Favoriten", systemImage: bib.favorite ? "star.slash" : "star") {
                        withAnimation(.spring) { store.toggleFavorite(bib) }
                    }
                    Button("Bearbeiten", systemImage: "pencil", action: onEdit)
                    ShareLink(item: "\(bib.race.name), \(bib.fullNumber)")
                    Divider()
                    Button("Löschen", systemImage: "trash", role: .destructive) {
                        withAnimation { store.delete(bib) }
                    }
                } preview: {
                    BibView(bib: bib).frame(width: 300)
                }
            HStack(spacing: 6) {
                if bib.favorite {
                    Image(systemName: "star.fill")
                        .font(.system(size: 11))
                        .foregroundStyle(Holo.soft)
                        .transition(.scale.combined(with: .opacity))
                }
                Text(bib.line)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(bib.favorite ? AnyShapeStyle(Holo.soft) : AnyShapeStyle(Color.bibGrey))
            }
        }
    }
}
