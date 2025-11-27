import SwiftUI

struct SettingsView: View {
    @State private var langManager = LanguageManager.shared

    var body: some View {
        ZStack {
            // Background gradient matching splash screen
            LinearGradient(
                colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.3),
                    Color(red: 0.2, green: 0.1, blue: 0.4),
                    Color(red: 0.3, green: 0.1, blue: 0.5)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 32) {
                Text(L10n.get("tab.settings"))
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .white.opacity(0.4), radius: 8)
                    .padding(.top, 8)

                Spacer()

                // Language section
                VStack(alignment: .leading, spacing: 16) {
                    Text(L10n.get("detail.language"))
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))

                    HStack(spacing: 12) {
                        ForEach(Language.allCases, id: \.rawValue) { lang in
                            Button {
                                langManager.setLanguage(lang)
                            } label: {
                                HStack {
                                    Image(systemName: "globe")
                                    Text(lang.displayName)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(langManager.currentLanguage == lang
                                              ? Color.white.opacity(0.3)
                                              : Color.white.opacity(0.1))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(langManager.currentLanguage == lang
                                                ? Color.white.opacity(0.5)
                                                : Color.white.opacity(0.2), lineWidth: 1)
                                )
                                .foregroundColor(.white)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 24)

                Spacer()
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}

