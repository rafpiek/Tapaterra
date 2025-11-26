import Foundation
import SwiftUI
import Combine

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String = "en" {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
            setBundleLanguage(currentLanguage)
        }
    }

    init() {
        // Load saved language or use device language
        if let savedLanguage = UserDefaults.standard.string(forKey: "appLanguage") {
            currentLanguage = savedLanguage
        } else {
            // Detect device language
            let deviceLanguage = Locale.current.language.languageCode?.identifier ?? "en"
            currentLanguage = (deviceLanguage == "pl") ? "pl" : "en"
        }
        setBundleLanguage(currentLanguage)
    }

    private var bundle: Bundle = Bundle.main

    private func setBundleLanguage(_ language: String) {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            // Fallback to English if language bundle not found
            self.bundle = Bundle.main
            return
        }
        self.bundle = bundle
    }

    func localizedString(_ key: String) -> String {
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }

    func setLanguage(_ language: String) {
        currentLanguage = language
    }
}