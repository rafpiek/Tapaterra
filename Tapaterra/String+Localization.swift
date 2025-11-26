import Foundation

extension String {
    /// Returns the localized string for the current locale
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    /// Returns the localized string with arguments for string formatting
    func localized(with arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}