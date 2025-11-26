//
//  TapaterraApp.swift
//  Tapaterra
//
//  Created by Rafał Piekara on 26/11/2025.
//

import SwiftUI
import SwiftData

@main
struct TapaterraApp: App {
    @State private var showSplash = true

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Item.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            showSplash = false
                        }
                    }
                    .transition(.opacity)
                } else {
                    ContentView()
                        .transition(.opacity)
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
