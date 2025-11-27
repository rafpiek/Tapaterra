import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var langManager = LanguageManager.shared

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                LearnView()
            }
            .tabItem {
                Label(L10n.get("tab.learn"), systemImage: "book.fill")
            }
            .tag(0)

            NavigationStack {
                PlayView()
            }
            .tabItem {
                Label(L10n.get("tab.play"), systemImage: "gamecontroller.fill")
            }
            .tag(1)

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label(L10n.get("tab.settings"), systemImage: "gearshape.fill")
            }
            .tag(2)
        }
        .accentColor(.white)
        .id(langManager.currentLanguage) // Force refresh when language changes
    }
}

#Preview {
    MainTabView()
}

