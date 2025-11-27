import SwiftUI

struct LearnView: View {
    @State private var selectedContinent: Continent = .all
    @State private var selectedCountry: Country?
    @State private var langManager = LanguageManager.shared
    @State private var searchText: String = ""
    @FocusState private var isSearchFocused: Bool

    private var filteredCountries: [Country] {
        let byContinent = FlagData.countries(for: selectedContinent)
        guard !searchText.isEmpty else { return byContinent }
        return byContinent.filter { $0.localizedName.localizedCaseInsensitiveContains(searchText) }
    }

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

            VStack(spacing: 0) {
                // Custom header with title
                VStack(spacing: 0) {
                    Text(L10n.get("tab.learn"))
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.4), radius: 8)
                        .padding(.top, 8)
                        .padding(.bottom, 16)

                    // Continent selector
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(Continent.allCases, id: \.rawValue) { continent in
                                ContinentButton(
                                    continent: continent,
                                    isSelected: selectedContinent == continent
                                ) {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        selectedContinent = continent
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                }
                .background(Color.black.opacity(0.2))

                // Search bar
                HStack(spacing: 8) {
                    TextField("", text: $searchText, prompt: Text(L10n.get("search.placeholder")).foregroundColor(.white.opacity(0.5)))
                        .textFieldStyle(.plain)
                        .focused($isSearchFocused)
                        .submitLabel(.search)
                        .onSubmit {
                            isSearchFocused = false
                        }

                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                            isSearchFocused = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)

                // Flags grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12),
                        GridItem(.flexible(), spacing: 12)
                    ], spacing: 16) {
                        ForEach(filteredCountries) { country in
                            FlagCard(country: country) {
                                selectedCountry = country
                                isSearchFocused = false
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                }
                .onTapGesture {
                    isSearchFocused = false
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .sheet(item: $selectedCountry) { country in
            CountryDetailSheet(country: country)
        }
    }
}

struct ContinentButton: View {
    let continent: Continent
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: continent.icon)
                    .font(.system(size: 14, weight: .semibold))
                Text(continent.localizedName)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .foregroundColor(isSelected ? .white : .white.opacity(0.7))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color.white.opacity(0.3) : Color.white.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(isSelected ? 0.5 : 0.2), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

struct FlagCard: View {
    let country: Country
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                country.flagImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)

                Text(country.localizedName)
                    .font(.system(size: 11, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 28)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

struct CountryDetailSheet: View {
    let country: Country
    @Environment(\.dismiss) private var dismiss

    private var details: CountryDetails? {
        CountryDetailsData.details(for: country)
    }

    var body: some View {
        ZStack {
            // Background gradient
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

            ScrollView {
                VStack(spacing: 16) {
                    // Large flag
                    country.flagImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                        .padding(.top, 20)

                    // Country name
                    Text(country.localizedName)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.3), radius: 4)

                    // Scroll indicator - visible initially
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 12, weight: .semibold))
                        Text(L10n.get("detail.scroll_hint"))
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                        Image(systemName: "arrow.down")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.15))
                    )

                    // Details
                    if let details = details {
                        VStack(spacing: 16) {
                            if let capital = details.capital {
                                DetailRow(title: L10n.get("detail.capital"), value: L10n.capital(capital))
                            }

                            if !details.mainCities.isEmpty {
                                DetailRow(title: L10n.get("detail.main_cities"), values: details.mainCities)
                            }

                            if !details.neighbours.isEmpty {
                                DetailRow(title: L10n.get("detail.neighbours"), values: details.neighbours.map { L10n.neighbour($0) })
                            }

                            if !details.mainRivers.isEmpty {
                                DetailRow(title: L10n.get("detail.main_rivers"), values: details.mainRivers)
                            }

                            if !details.mainMountains.isEmpty {
                                DetailRow(title: L10n.get("detail.main_mountains"), values: details.mainMountains)
                            }

                            // Additional info row
                            HStack(spacing: 12) {
                                if let population = details.population {
                                    InfoBadge(label: L10n.get("detail.population"), value: formatPopulation(population))
                                }
                                if let area = details.area {
                                    InfoBadge(label: L10n.get("detail.area"), value: formatArea(area))
                                }
                            }

                            HStack(spacing: 12) {
                                if let currency = details.currency {
                                    InfoBadge(label: L10n.get("detail.currency"), value: L10n.currency(currency))
                                }
                                if let language = details.language {
                                    InfoBadge(label: L10n.get("detail.language"), value: L10n.language(language))
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    } else {
                        Text(L10n.get("detail.no_data"))
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .presentationDetents([.fraction(0.75), .large])
        .presentationDragIndicator(.visible)
    }

    private func formatPopulation(_ population: Int) -> String {
        if population >= 1_000_000_000 {
            return String(format: "%.1fB", Double(population) / 1_000_000_000.0)
        } else if population >= 1_000_000 {
            return String(format: "%.1fM", Double(population) / 1_000_000.0)
        } else if population >= 1_000 {
            return String(format: "%.0fK", Double(population) / 1_000.0)
        }
        return "\(population)"
    }

    private func formatArea(_ area: Double) -> String {
        if area >= 1_000_000 {
            return String(format: "%.1fM km²", area / 1_000_000.0)
        } else if area >= 1_000 {
            return String(format: "%.0fK km²", area / 1_000.0)
        }
        return String(format: "%.0f km²", area)
    }
}

struct DetailRow: View {
    let title: String
    var value: String? = nil
    var values: [String]? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.7))

            if let value = value {
                Text(value)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
            }

            if let values = values, !values.isEmpty {
                Text(values.joined(separator: ", "))
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
        )
    }
}

struct InfoBadge: View {
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
            Text(value)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.1))
        )
    }
}

#Preview {
    NavigationStack {
        LearnView()
    }
}

