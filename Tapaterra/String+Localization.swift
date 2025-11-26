import Foundation
import SwiftUI

// Global language manager instance
var currentLanguageManager: LanguageManager?

extension String {
    /// Returns the localized string for the current locale
    var localized: String {
        return currentLanguageManager?.localizedString(self) ?? NSLocalizedString(self, comment: "")
    }

    /// Returns the localized string with arguments for string formatting
    func localized(with arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}

// Helper view for localized text
struct LocalizedText: View {
    let key: String

    var body: some View {
        Text(key.localized)
    }
}