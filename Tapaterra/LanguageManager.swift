import Foundation
import SwiftUI

enum Language: String, CaseIterable {
    case en, pl

    var displayName: String {
        switch self {
        case .en: return "English"
        case .pl: return "Polski"
        }
    }
}

@Observable
final class LanguageManager {
    static let shared = LanguageManager()

    var currentLanguage: Language {
        didSet {
            UserDefaults.standard.set(currentLanguage.rawValue, forKey: "appLanguage")
        }
    }

    private init() {
        let saved = UserDefaults.standard.string(forKey: "appLanguage")
        self.currentLanguage = Language(rawValue: saved ?? "") ?? .en
    }

    func setLanguage(_ lang: Language) {
        currentLanguage = lang
    }
}

// Static translations
enum L10n {
    static func get(_ key: String) -> String {
        let lang = LanguageManager.shared.currentLanguage
        return translations[lang]?[key] ?? key
    }

    private static let translations: [Language: [String: String]] = [
        .en: [
            "splash.flags": "Flags",
            "splash.app_title": "Tapaterra",
            "splash.subtitle": "Explore the World's Flags",
            "preview_flags": "Preview Flags",
            "add_item": "Add Item",
            "select_item": "Select an item",
            "item_at": "Item at",
            "language": "Language",
            "change_language": "Change Language",
        ],
        .pl: [
            "splash.flags": "Flagi",
            "splash.app_title": "Tapaterra",
            "splash.subtitle": "Poznaj flagi świata",
            "preview_flags": "Podgląd flag",
            "add_item": "Dodaj element",
            "select_item": "Wybierz element",
            "item_at": "Element z",
            "language": "Język",
            "change_language": "Zmień język",
        ]
    ]
}
