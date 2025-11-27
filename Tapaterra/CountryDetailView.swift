import SwiftUI

struct CountryDetailView: View {
    let country: Country
    @Environment(\.dismiss) private var dismiss

    private var details: CountryDetails? {
        CountryDetailsData.details(for: country)
    }

    var body: some View {
        ZStack {
            // Background gradient matching app theme
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
                VStack(spacing: 24) {
                    // Large flag
                    country.flagImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                        .padding(.top, 20)

                    // Country name
                    Text(country.name)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .white.opacity(0.3), radius: 4)

                    // Details sections
                    if let details = details {
                        VStack(spacing: 20) {
                            if let capital = details.capital {
                                DetailSection(
                                    title: L10n.get("detail.capital"),
                                    items: [capital]
                                )
                            }

                            if !details.mainCities.isEmpty {
                                DetailSection(
                                    title: L10n.get("detail.main_cities"),
                                    items: details.mainCities
                                )
                            }

                            if !details.mainRivers.isEmpty {
                                DetailSection(
                                    title: L10n.get("detail.main_rivers"),
                                    items: details.mainRivers
                                )
                            }

                            if !details.mainMountains.isEmpty {
                                DetailSection(
                                    title: L10n.get("detail.main_mountains"),
                                    items: details.mainMountains
                                )
                            }

                            if !details.neighbours.isEmpty {
                                DetailSection(
                                    title: L10n.get("detail.neighbours"),
                                    items: details.neighbours
                                )
                            }

                            // Additional info
                            if let population = details.population {
                                InfoRow(
                                    label: L10n.get("detail.population"),
                                    value: formatPopulation(population)
                                )
                            }

                            if let area = details.area {
                                InfoRow(
                                    label: L10n.get("detail.area"),
                                    value: formatArea(area)
                                )
                            }

                            if let currency = details.currency {
                                InfoRow(
                                    label: L10n.get("detail.currency"),
                                    value: currency
                                )
                            }

                            if let language = details.language {
                                InfoRow(
                                    label: L10n.get("detail.language"),
                                    value: language
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                    } else {
                        Text(L10n.get("detail.no_data"))
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.top, 20)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }

    private func formatPopulation(_ population: Int) -> String {
        if population >= 1_000_000_000 {
            return String(format: "%.2fB", Double(population) / 1_000_000_000.0)
        } else if population >= 1_000_000 {
            return String(format: "%.2fM", Double(population) / 1_000_000.0)
        } else if population >= 1_000 {
            return String(format: "%.1fK", Double(population) / 1_000.0)
        }
        return "\(population)"
    }

    private func formatArea(_ area: Double) -> String {
        if area >= 1_000_000 {
            return String(format: "%.1fM km²", area / 1_000_000.0)
        } else if area >= 1_000 {
            return String(format: "%.1fK km²", area / 1_000.0)
        }
        return String(format: "%.0f km²", area)
    }
}

struct DetailSection: View {
    let title: String
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(items, id: \.self) { item in
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 6, height: 6)
                        Text(item)
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
            }
            .padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
            Spacer()
            Text(value)
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.1))
        )
    }
}

#Preview {
    NavigationStack {
        CountryDetailView(country: Country(
            name: "Poland",
            imageName: "Flags/poland",
            continent: .europe,
            isoCode: "PL"
        ))
    }
}

