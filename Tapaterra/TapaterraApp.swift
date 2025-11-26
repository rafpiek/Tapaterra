//
//  TapaterraApp.swift
//  Tapaterra
//
//  Created by Rafał Piekara on 26/11/2025.
//

import SwiftUI
import SwiftData
import Combine

@main
struct TapaterraApp: App {
    @StateObject private var splashState = SplashStateManager()
    @StateObject private var languageManager = LanguageManager()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ZStack {
                if splashState.showMainContent {
                    ContentView()
                        .environmentObject(languageManager)
                        .transition(.opacity)
                } else {
                    SplashView()
                        .environmentObject(languageManager)
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 1.0), value: splashState.showMainContent)
            .environmentObject(splashState)
            .onAppear {
                currentLanguageManager = languageManager
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

class SplashStateManager: ObservableObject {
    @Published var showMainContent = false

    func showMainApp() {
        withAnimation(.easeInOut(duration: 1.0)) {
            showMainContent = true
        }
    }
}
