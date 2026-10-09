import SwiftUI

@main
struct StartnummernApp: App {
    @State private var store = BibStore()

    init() {
        BibFont.registerAll()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(store)
                .preferredColorScheme(.dark)
                .tint(.bibRed)
        }
    }
}

enum AppTab: Hashable {
    case start, collection, add, achievements, profile
}

struct RootView: View {
    @State private var tab: AppTab = .start

    var body: some View {
        TabView(selection: $tab) {
            Tab("Start", systemImage: "rectangle.stack", value: AppTab.start) {
                StartView()
            }
            Tab("Sammlung", systemImage: "square.grid.2x2", value: AppTab.collection) {
                CollectionView()
            }
            Tab("Hinzufügen", systemImage: "plus.circle", value: AppTab.add) {
                AddView(onFinished: { tab = .collection })
            }
            Tab("Erfolge", systemImage: "trophy", value: AppTab.achievements) {
                AchievementsView()
            }
            Tab("Profil", systemImage: "person", value: AppTab.profile) {
                ProfileView()
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView("Profil", systemImage: "person", description: Text("Kommt später."))
                .navigationTitle("Profil")
        }
    }
}

extension Color {
    static let bibRed = Color(hex: 0xFF123E)
    static let bibGrey = Color(hex: 0x8A8A99)

    init(hex: UInt32, opacity: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
}
