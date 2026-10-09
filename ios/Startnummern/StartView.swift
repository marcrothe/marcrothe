import SwiftUI

/// Startseite: die Startnummern als Stapel zum Durchwischen.
struct StartView: View {
    @Environment(BibStore.self) private var store
    @State private var editing: Bib?

    var body: some View {
        NavigationStack {
            TabView {
                ForEach(store.sortedByDate) { bib in
                    VStack(spacing: 18) {
                        FlipBib(bib: bib)
                            .frame(width: 300)
                            .contextMenu {
                                Button(bib.favorite ? "Aus Favoriten entfernen" : "Zu Favoriten", systemImage: bib.favorite ? "star.slash" : "star") {
                                    withAnimation(.spring) { store.toggleFavorite(bib) }
                                }
                                Button("Bearbeiten", systemImage: "pencil") { editing = bib }
                                ShareLink(item: "\(bib.race.name), \(bib.fullNumber)")
                                Divider()
                                Button("Löschen", systemImage: "trash", role: .destructive) {
                                    withAnimation { store.delete(bib) }
                                }
                            }
                        HStack(spacing: 6) {
                            if bib.favorite {
                                Image(systemName: "star.fill").font(.system(size: 12)).foregroundStyle(Holo.soft)
                            }
                            Text(bib.line)
                                .font(.footnote.weight(.semibold))
                                .foregroundStyle(bib.favorite ? AnyShapeStyle(Holo.soft) : AnyShapeStyle(Color.bibGrey))
                        }
                    }
                    .padding(.bottom, 60)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationTitle("Startnummern")
            .sheet(item: $editing) { bib in
                AddView(editing: bib)
            }
        }
    }
}
