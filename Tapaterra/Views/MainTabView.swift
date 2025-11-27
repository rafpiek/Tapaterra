import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                LearnView()
            }
            .tabItem {
                Label("Learn", systemImage: "book.fill")
            }
            .tag(0)

            NavigationStack {
                PlayView()
            }
            .tabItem {
                Label("Play", systemImage: "gamecontroller.fill")
            }
            .tag(1)

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(2)
        }
        .accentColor(.white)
    }
}

#Preview {
    MainTabView()
}

