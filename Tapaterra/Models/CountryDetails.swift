import Foundation

struct CountryDetails {
    let isoCode: String
    let capital: String?
    let mainCities: [String]
    let mainRivers: [String]
    let mainMountains: [String]
    let neighbours: [String]
    let population: Int?
    let area: Double? // in km²
    let currency: String?
    let language: String?
}

struct CountryDetailsData {
    static var details: [String: CountryDetails] = [:]

    static func details(for country: Country) -> CountryDetails? {
        if details.isEmpty {
            loadDetails()
        }
        return details[country.isoCode]
    }

    // loadDetails() implementation is in CountryDetailsData.generated.swift
}

