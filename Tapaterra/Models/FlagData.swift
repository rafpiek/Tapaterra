import SwiftUI

enum Continent: String, CaseIterable {
    case all = "All"
    case europe = "Europe"
    case africa = "Africa"
    case asia = "Asia"
    case northAmerica = "North America"
    case southAmerica = "South America"
    case oceania = "Oceania"
    case antarctica = "Antarctica"

    var icon: String {
        switch self {
        case .all: return "globe"
        case .africa: return "globe.europe.africa"
        case .asia: return "globe.asia.australia"
        case .europe: return "globe.europe.africa.fill"
        case .northAmerica: return "globe.americas"
        case .southAmerica: return "globe.americas.fill"
        case .oceania: return "globe.asia.australia.fill"
        case .antarctica: return "snowflake"
        }
    }
}

struct Country: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let continent: Continent
    let isoCode: String

    var flagImage: Image {
        Image(imageName)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.id == rhs.id
    }
}

struct FlagData {
    static let allCountries: [Country] = [
        // Africa
        Country(name: "Algeria", imageName: "Flags/algeria", continent: .africa, isoCode: "DZ"),
        Country(name: "Angola", imageName: "Flags/angola", continent: .africa, isoCode: "AO"),
        Country(name: "Benin", imageName: "Flags/benin", continent: .africa, isoCode: "BJ"),
        Country(name: "Botswana", imageName: "Flags/botswana", continent: .africa, isoCode: "BW"),
        Country(name: "Burkina Faso", imageName: "Flags/burkina-faso", continent: .africa, isoCode: "BF"),
        Country(name: "Burundi", imageName: "Flags/burundi", continent: .africa, isoCode: "BI"),
        Country(name: "Cabo Verde", imageName: "Flags/cabo-verde", continent: .africa, isoCode: "CV"),
        Country(name: "Cameroon", imageName: "Flags/cameroon", continent: .africa, isoCode: "CM"),
        Country(name: "Central African Republic", imageName: "Flags/central-african-republic", continent: .africa, isoCode: "CF"),
        Country(name: "Chad", imageName: "Flags/chad", continent: .africa, isoCode: "TD"),
        Country(name: "Comoros", imageName: "Flags/comoros", continent: .africa, isoCode: "KM"),
        Country(name: "Congo", imageName: "Flags/congo", continent: .africa, isoCode: "CG"),
        Country(name: "DR Congo", imageName: "Flags/congo-democratic-republic", continent: .africa, isoCode: "CD"),
        Country(name: "Côte d'Ivoire", imageName: "Flags/cote-divoire", continent: .africa, isoCode: "CI"),
        Country(name: "Djibouti", imageName: "Flags/djibouti", continent: .africa, isoCode: "DJ"),
        Country(name: "Egypt", imageName: "Flags/egypt", continent: .africa, isoCode: "EG"),
        Country(name: "Equatorial Guinea", imageName: "Flags/equatorial-guinea", continent: .africa, isoCode: "GQ"),
        Country(name: "Eritrea", imageName: "Flags/eritrea", continent: .africa, isoCode: "ER"),
        Country(name: "Eswatini", imageName: "Flags/eswatini", continent: .africa, isoCode: "SZ"),
        Country(name: "Ethiopia", imageName: "Flags/ethiopia", continent: .africa, isoCode: "ET"),
        Country(name: "Gabon", imageName: "Flags/gabon", continent: .africa, isoCode: "GA"),
        Country(name: "Gambia", imageName: "Flags/gambia", continent: .africa, isoCode: "GM"),
        Country(name: "Ghana", imageName: "Flags/ghana", continent: .africa, isoCode: "GH"),
        Country(name: "Guinea", imageName: "Flags/guinea", continent: .africa, isoCode: "GN"),
        Country(name: "Guinea-Bissau", imageName: "Flags/guinea-bissau", continent: .africa, isoCode: "GW"),
        Country(name: "Kenya", imageName: "Flags/kenya", continent: .africa, isoCode: "KE"),
        Country(name: "Lesotho", imageName: "Flags/lesotho", continent: .africa, isoCode: "LS"),
        Country(name: "Liberia", imageName: "Flags/liberia", continent: .africa, isoCode: "LR"),
        Country(name: "Libya", imageName: "Flags/libya", continent: .africa, isoCode: "LY"),
        Country(name: "Madagascar", imageName: "Flags/madagascar", continent: .africa, isoCode: "MG"),
        Country(name: "Malawi", imageName: "Flags/malawi", continent: .africa, isoCode: "MW"),
        Country(name: "Mali", imageName: "Flags/mali", continent: .africa, isoCode: "ML"),
        Country(name: "Mauritania", imageName: "Flags/mauritania", continent: .africa, isoCode: "MR"),
        Country(name: "Mauritius", imageName: "Flags/mauritius", continent: .africa, isoCode: "MU"),
        Country(name: "Mayotte", imageName: "Flags/mayotte", continent: .africa, isoCode: "YT"),
        Country(name: "Morocco", imageName: "Flags/morocco", continent: .africa, isoCode: "MA"),
        Country(name: "Mozambique", imageName: "Flags/mozambique", continent: .africa, isoCode: "MZ"),
        Country(name: "Namibia", imageName: "Flags/namibia", continent: .africa, isoCode: "NA"),
        Country(name: "Niger", imageName: "Flags/niger", continent: .africa, isoCode: "NE"),
        Country(name: "Nigeria", imageName: "Flags/nigeria", continent: .africa, isoCode: "NG"),
        Country(name: "Réunion", imageName: "Flags/reunion", continent: .africa, isoCode: "RE"),
        Country(name: "Rwanda", imageName: "Flags/rwanda", continent: .africa, isoCode: "RW"),
        Country(name: "Saint Helena", imageName: "Flags/saint-helena", continent: .africa, isoCode: "SH"),
        Country(name: "São Tomé and Príncipe", imageName: "Flags/sao-tome-and-principe", continent: .africa, isoCode: "ST"),
        Country(name: "Senegal", imageName: "Flags/senegal", continent: .africa, isoCode: "SN"),
        Country(name: "Seychelles", imageName: "Flags/seychelles", continent: .africa, isoCode: "SC"),
        Country(name: "Sierra Leone", imageName: "Flags/sierra-leone", continent: .africa, isoCode: "SL"),
        Country(name: "Somalia", imageName: "Flags/somalia", continent: .africa, isoCode: "SO"),
        Country(name: "South Africa", imageName: "Flags/south-africa", continent: .africa, isoCode: "ZA"),
        Country(name: "South Sudan", imageName: "Flags/south-sudan", continent: .africa, isoCode: "SS"),
        Country(name: "Sudan", imageName: "Flags/sudan", continent: .africa, isoCode: "SD"),
        Country(name: "Tanzania", imageName: "Flags/tanzania", continent: .africa, isoCode: "TZ"),
        Country(name: "Togo", imageName: "Flags/togo", continent: .africa, isoCode: "TG"),
        Country(name: "Tunisia", imageName: "Flags/tunisia", continent: .africa, isoCode: "TN"),
        Country(name: "Uganda", imageName: "Flags/uganda", continent: .africa, isoCode: "UG"),
        Country(name: "Western Sahara", imageName: "Flags/western-sahara", continent: .africa, isoCode: "EH"),
        Country(name: "Zambia", imageName: "Flags/zambia", continent: .africa, isoCode: "ZM"),
        Country(name: "Zimbabwe", imageName: "Flags/zimbabwe", continent: .africa, isoCode: "ZW"),

        // Asia
        Country(name: "Afghanistan", imageName: "Flags/afghanistan", continent: .asia, isoCode: "AF"),
        Country(name: "Armenia", imageName: "Flags/armenia", continent: .asia, isoCode: "AM"),
        Country(name: "Azerbaijan", imageName: "Flags/azerbaijan", continent: .asia, isoCode: "AZ"),
        Country(name: "Bahrain", imageName: "Flags/bahrain", continent: .asia, isoCode: "BH"),
        Country(name: "Bangladesh", imageName: "Flags/bangladesh", continent: .asia, isoCode: "BD"),
        Country(name: "Bhutan", imageName: "Flags/bhutan", continent: .asia, isoCode: "BT"),
        Country(name: "Brunei", imageName: "Flags/brunei", continent: .asia, isoCode: "BN"),
        Country(name: "Cambodia", imageName: "Flags/cambodia", continent: .asia, isoCode: "KH"),
        Country(name: "China", imageName: "Flags/china", continent: .asia, isoCode: "CN"),
        Country(name: "Cyprus", imageName: "Flags/cyprus", continent: .asia, isoCode: "CY"),
        Country(name: "Georgia", imageName: "Flags/georgia", continent: .asia, isoCode: "GE"),
        Country(name: "Hong Kong", imageName: "Flags/hong-kong", continent: .asia, isoCode: "HK"),
        Country(name: "India", imageName: "Flags/india", continent: .asia, isoCode: "IN"),
        Country(name: "Indonesia", imageName: "Flags/indonesia", continent: .asia, isoCode: "ID"),
        Country(name: "Iran", imageName: "Flags/iran", continent: .asia, isoCode: "IR"),
        Country(name: "Iraq", imageName: "Flags/iraq", continent: .asia, isoCode: "IQ"),
        Country(name: "Israel", imageName: "Flags/israel", continent: .asia, isoCode: "IL"),
        Country(name: "Japan", imageName: "Flags/japan", continent: .asia, isoCode: "JP"),
        Country(name: "Jordan", imageName: "Flags/jordan", continent: .asia, isoCode: "JO"),
        Country(name: "Kazakhstan", imageName: "Flags/kazakhstan", continent: .asia, isoCode: "KZ"),
        Country(name: "Kuwait", imageName: "Flags/kuwait", continent: .asia, isoCode: "KW"),
        Country(name: "Kyrgyzstan", imageName: "Flags/kyrgyzstan", continent: .asia, isoCode: "KG"),
        Country(name: "Laos", imageName: "Flags/laos", continent: .asia, isoCode: "LA"),
        Country(name: "Lebanon", imageName: "Flags/lebanon", continent: .asia, isoCode: "LB"),
        Country(name: "Macao", imageName: "Flags/macao", continent: .asia, isoCode: "MO"),
        Country(name: "Malaysia", imageName: "Flags/malaysia", continent: .asia, isoCode: "MY"),
        Country(name: "Maldives", imageName: "Flags/maldives", continent: .asia, isoCode: "MV"),
        Country(name: "Mongolia", imageName: "Flags/mongolia", continent: .asia, isoCode: "MN"),
        Country(name: "Myanmar", imageName: "Flags/myanmar", continent: .asia, isoCode: "MM"),
        Country(name: "Nepal", imageName: "Flags/nepal", continent: .asia, isoCode: "NP"),
        Country(name: "North Korea", imageName: "Flags/north-korea", continent: .asia, isoCode: "KP"),
        Country(name: "Oman", imageName: "Flags/oman", continent: .asia, isoCode: "OM"),
        Country(name: "Pakistan", imageName: "Flags/pakistan", continent: .asia, isoCode: "PK"),
        Country(name: "Palestine", imageName: "Flags/palestine", continent: .asia, isoCode: "PS"),
        Country(name: "Philippines", imageName: "Flags/philippines", continent: .asia, isoCode: "PH"),
        Country(name: "Qatar", imageName: "Flags/qatar", continent: .asia, isoCode: "QA"),
        Country(name: "Saudi Arabia", imageName: "Flags/saudi-arabia", continent: .asia, isoCode: "SA"),
        Country(name: "Singapore", imageName: "Flags/singapore", continent: .asia, isoCode: "SG"),
        Country(name: "South Korea", imageName: "Flags/south-korea", continent: .asia, isoCode: "KR"),
        Country(name: "Sri Lanka", imageName: "Flags/sri-lanka", continent: .asia, isoCode: "LK"),
        Country(name: "Syria", imageName: "Flags/syria", continent: .asia, isoCode: "SY"),
        Country(name: "Taiwan", imageName: "Flags/taiwan", continent: .asia, isoCode: "TW"),
        Country(name: "Tajikistan", imageName: "Flags/tajikistan", continent: .asia, isoCode: "TJ"),
        Country(name: "Thailand", imageName: "Flags/thailand", continent: .asia, isoCode: "TH"),
        Country(name: "Timor-Leste", imageName: "Flags/timor-leste", continent: .asia, isoCode: "TL"),
        Country(name: "Turkey", imageName: "Flags/turkey", continent: .asia, isoCode: "TR"),
        Country(name: "Turkmenistan", imageName: "Flags/turkmenistan", continent: .asia, isoCode: "TM"),
        Country(name: "UAE", imageName: "Flags/united-arab-emirates", continent: .asia, isoCode: "AE"),
        Country(name: "Uzbekistan", imageName: "Flags/uzbekistan", continent: .asia, isoCode: "UZ"),
        Country(name: "Vietnam", imageName: "Flags/vietnam", continent: .asia, isoCode: "VN"),
        Country(name: "Yemen", imageName: "Flags/yemen", continent: .asia, isoCode: "YE"),

        // Europe
        Country(name: "Åland Islands", imageName: "Flags/aland-islands", continent: .europe, isoCode: "AX"),
        Country(name: "Albania", imageName: "Flags/albania", continent: .europe, isoCode: "AL"),
        Country(name: "Andorra", imageName: "Flags/andorra", continent: .europe, isoCode: "AD"),
        Country(name: "Austria", imageName: "Flags/austria", continent: .europe, isoCode: "AT"),
        Country(name: "Belarus", imageName: "Flags/belarus", continent: .europe, isoCode: "BY"),
        Country(name: "Belgium", imageName: "Flags/belgium", continent: .europe, isoCode: "BE"),
        Country(name: "Bosnia and Herzegovina", imageName: "Flags/bosnia-and-herzegovina", continent: .europe, isoCode: "BA"),
        Country(name: "Bulgaria", imageName: "Flags/bulgaria", continent: .europe, isoCode: "BG"),
        Country(name: "Croatia", imageName: "Flags/croatia", continent: .europe, isoCode: "HR"),
        Country(name: "Czechia", imageName: "Flags/czechia", continent: .europe, isoCode: "CZ"),
        Country(name: "Denmark", imageName: "Flags/denmark", continent: .europe, isoCode: "DK"),
        Country(name: "Estonia", imageName: "Flags/estonia", continent: .europe, isoCode: "EE"),
        Country(name: "Faroe Islands", imageName: "Flags/faroe-islands", continent: .europe, isoCode: "FO"),
        Country(name: "Finland", imageName: "Flags/finland", continent: .europe, isoCode: "FI"),
        Country(name: "France", imageName: "Flags/france", continent: .europe, isoCode: "FR"),
        Country(name: "Germany", imageName: "Flags/germany", continent: .europe, isoCode: "DE"),
        Country(name: "Gibraltar", imageName: "Flags/gibraltar", continent: .europe, isoCode: "GI"),
        Country(name: "Greece", imageName: "Flags/greece", continent: .europe, isoCode: "GR"),
        Country(name: "Guernsey", imageName: "Flags/guernsey", continent: .europe, isoCode: "GG"),
        Country(name: "Hungary", imageName: "Flags/hungary", continent: .europe, isoCode: "HU"),
        Country(name: "Iceland", imageName: "Flags/iceland", continent: .europe, isoCode: "IS"),
        Country(name: "Ireland", imageName: "Flags/ireland", continent: .europe, isoCode: "IE"),
        Country(name: "Isle of Man", imageName: "Flags/isle-of-man", continent: .europe, isoCode: "IM"),
        Country(name: "Italy", imageName: "Flags/italy", continent: .europe, isoCode: "IT"),
        Country(name: "Jersey", imageName: "Flags/jersey", continent: .europe, isoCode: "JE"),
        Country(name: "Kosovo", imageName: "Flags/kosovo", continent: .europe, isoCode: "XK"),
        Country(name: "Latvia", imageName: "Flags/latvia", continent: .europe, isoCode: "LV"),
        Country(name: "Liechtenstein", imageName: "Flags/liechtenstein", continent: .europe, isoCode: "LI"),
        Country(name: "Lithuania", imageName: "Flags/lithuania", continent: .europe, isoCode: "LT"),
        Country(name: "Luxembourg", imageName: "Flags/luxembourg", continent: .europe, isoCode: "LU"),
        Country(name: "Malta", imageName: "Flags/malta", continent: .europe, isoCode: "MT"),
        Country(name: "Moldova", imageName: "Flags/moldova", continent: .europe, isoCode: "MD"),
        Country(name: "Monaco", imageName: "Flags/monaco", continent: .europe, isoCode: "MC"),
        Country(name: "Montenegro", imageName: "Flags/montenegro", continent: .europe, isoCode: "ME"),
        Country(name: "Netherlands", imageName: "Flags/netherlands", continent: .europe, isoCode: "NL"),
        Country(name: "North Macedonia", imageName: "Flags/north-macedonia", continent: .europe, isoCode: "MK"),
        Country(name: "Norway", imageName: "Flags/norway", continent: .europe, isoCode: "NO"),
        Country(name: "Poland", imageName: "Flags/poland", continent: .europe, isoCode: "PL"),
        Country(name: "Portugal", imageName: "Flags/portugal", continent: .europe, isoCode: "PT"),
        Country(name: "Romania", imageName: "Flags/romania", continent: .europe, isoCode: "RO"),
        Country(name: "Russia", imageName: "Flags/russia", continent: .europe, isoCode: "RU"),
        Country(name: "San Marino", imageName: "Flags/san-marino", continent: .europe, isoCode: "SM"),
        Country(name: "Serbia", imageName: "Flags/serbia", continent: .europe, isoCode: "RS"),
        Country(name: "Slovakia", imageName: "Flags/slovakia", continent: .europe, isoCode: "SK"),
        Country(name: "Slovenia", imageName: "Flags/slovenia", continent: .europe, isoCode: "SI"),
        Country(name: "Spain", imageName: "Flags/spain", continent: .europe, isoCode: "ES"),
        Country(name: "Svalbard and Jan Mayen", imageName: "Flags/svalbard-and-jan-mayen", continent: .europe, isoCode: "SJ"),
        Country(name: "Sweden", imageName: "Flags/sweden", continent: .europe, isoCode: "SE"),
        Country(name: "Switzerland", imageName: "Flags/switzerland", continent: .europe, isoCode: "CH"),
        Country(name: "Ukraine", imageName: "Flags/ukraine", continent: .europe, isoCode: "UA"),
        Country(name: "United Kingdom", imageName: "Flags/united-kingdom", continent: .europe, isoCode: "GB"),
        Country(name: "Vatican City", imageName: "Flags/vatican-city", continent: .europe, isoCode: "VA"),

        // North America
        Country(name: "Anguilla", imageName: "Flags/anguilla", continent: .northAmerica, isoCode: "AI"),
        Country(name: "Antigua and Barbuda", imageName: "Flags/antigua-and-barbuda", continent: .northAmerica, isoCode: "AG"),
        Country(name: "Aruba", imageName: "Flags/aruba", continent: .northAmerica, isoCode: "AW"),
        Country(name: "Bahamas", imageName: "Flags/bahamas", continent: .northAmerica, isoCode: "BS"),
        Country(name: "Barbados", imageName: "Flags/barbados", continent: .northAmerica, isoCode: "BB"),
        Country(name: "Belize", imageName: "Flags/belize", continent: .northAmerica, isoCode: "BZ"),
        Country(name: "Bermuda", imageName: "Flags/bermuda", continent: .northAmerica, isoCode: "BM"),
        Country(name: "Bonaire", imageName: "Flags/bonaire-sint-eustatius-and-saba", continent: .northAmerica, isoCode: "BQ"),
        Country(name: "British Virgin Islands", imageName: "Flags/british-virgin-islands", continent: .northAmerica, isoCode: "VG"),
        Country(name: "Canada", imageName: "Flags/canada", continent: .northAmerica, isoCode: "CA"),
        Country(name: "Cayman Islands", imageName: "Flags/cayman-islands", continent: .northAmerica, isoCode: "KY"),
        Country(name: "Costa Rica", imageName: "Flags/costa-rica", continent: .northAmerica, isoCode: "CR"),
        Country(name: "Cuba", imageName: "Flags/cuba", continent: .northAmerica, isoCode: "CU"),
        Country(name: "Curaçao", imageName: "Flags/curacao", continent: .northAmerica, isoCode: "CW"),
        Country(name: "Dominica", imageName: "Flags/dominica", continent: .northAmerica, isoCode: "DM"),
        Country(name: "Dominican Republic", imageName: "Flags/dominican-republic", continent: .northAmerica, isoCode: "DO"),
        Country(name: "El Salvador", imageName: "Flags/el-salvador", continent: .northAmerica, isoCode: "SV"),
        Country(name: "Greenland", imageName: "Flags/greenland", continent: .northAmerica, isoCode: "GL"),
        Country(name: "Grenada", imageName: "Flags/grenada", continent: .northAmerica, isoCode: "GD"),
        Country(name: "Guadeloupe", imageName: "Flags/guadeloupe", continent: .northAmerica, isoCode: "GP"),
        Country(name: "Guatemala", imageName: "Flags/guatemala", continent: .northAmerica, isoCode: "GT"),
        Country(name: "Haiti", imageName: "Flags/haiti", continent: .northAmerica, isoCode: "HT"),
        Country(name: "Honduras", imageName: "Flags/honduras", continent: .northAmerica, isoCode: "HN"),
        Country(name: "Jamaica", imageName: "Flags/jamaica", continent: .northAmerica, isoCode: "JM"),
        Country(name: "Martinique", imageName: "Flags/martinique", continent: .northAmerica, isoCode: "MQ"),
        Country(name: "Mexico", imageName: "Flags/mexico", continent: .northAmerica, isoCode: "MX"),
        Country(name: "Montserrat", imageName: "Flags/montserrat", continent: .northAmerica, isoCode: "MS"),
        Country(name: "Nicaragua", imageName: "Flags/nicaragua", continent: .northAmerica, isoCode: "NI"),
        Country(name: "Panama", imageName: "Flags/panama", continent: .northAmerica, isoCode: "PA"),
        Country(name: "Puerto Rico", imageName: "Flags/puerto-rico", continent: .northAmerica, isoCode: "PR"),
        Country(name: "Saint Barthélemy", imageName: "Flags/saint-barthelemy", continent: .northAmerica, isoCode: "BL"),
        Country(name: "Saint Kitts and Nevis", imageName: "Flags/saint-kitts-and-nevis", continent: .northAmerica, isoCode: "KN"),
        Country(name: "Saint Lucia", imageName: "Flags/saint-lucia", continent: .northAmerica, isoCode: "LC"),
        Country(name: "Saint Martin", imageName: "Flags/saint-martin", continent: .northAmerica, isoCode: "MF"),
        Country(name: "Saint Pierre and Miquelon", imageName: "Flags/saint-pierre-and-miquelon", continent: .northAmerica, isoCode: "PM"),
        Country(name: "Saint Vincent", imageName: "Flags/saint-vincent-and-the-grenadines", continent: .northAmerica, isoCode: "VC"),
        Country(name: "Sint Maarten", imageName: "Flags/sint-maarten", continent: .northAmerica, isoCode: "SX"),
        Country(name: "Trinidad and Tobago", imageName: "Flags/trinidad-and-tobago", continent: .northAmerica, isoCode: "TT"),
        Country(name: "Turks and Caicos", imageName: "Flags/turks-and-caicos-islands", continent: .northAmerica, isoCode: "TC"),
        Country(name: "United States", imageName: "Flags/united-states", continent: .northAmerica, isoCode: "US"),
        Country(name: "US Virgin Islands", imageName: "Flags/us-virgin-islands", continent: .northAmerica, isoCode: "VI"),

        // South America
        Country(name: "Argentina", imageName: "Flags/argentina", continent: .southAmerica, isoCode: "AR"),
        Country(name: "Bolivia", imageName: "Flags/bolivia", continent: .southAmerica, isoCode: "BO"),
        Country(name: "Brazil", imageName: "Flags/brazil", continent: .southAmerica, isoCode: "BR"),
        Country(name: "Chile", imageName: "Flags/chile", continent: .southAmerica, isoCode: "CL"),
        Country(name: "Colombia", imageName: "Flags/colombia", continent: .southAmerica, isoCode: "CO"),
        Country(name: "Ecuador", imageName: "Flags/ecuador", continent: .southAmerica, isoCode: "EC"),
        Country(name: "Falkland Islands", imageName: "Flags/falkland-islands", continent: .southAmerica, isoCode: "FK"),
        Country(name: "French Guiana", imageName: "Flags/french-guiana", continent: .southAmerica, isoCode: "GF"),
        Country(name: "Guyana", imageName: "Flags/guyana", continent: .southAmerica, isoCode: "GY"),
        Country(name: "Paraguay", imageName: "Flags/paraguay", continent: .southAmerica, isoCode: "PY"),
        Country(name: "Peru", imageName: "Flags/peru", continent: .southAmerica, isoCode: "PE"),
        Country(name: "Suriname", imageName: "Flags/suriname", continent: .southAmerica, isoCode: "SR"),
        Country(name: "Uruguay", imageName: "Flags/uruguay", continent: .southAmerica, isoCode: "UY"),
        Country(name: "Venezuela", imageName: "Flags/venezuela", continent: .southAmerica, isoCode: "VE"),

        // Oceania
        Country(name: "American Samoa", imageName: "Flags/american-samoa", continent: .oceania, isoCode: "AS"),
        Country(name: "Australia", imageName: "Flags/australia", continent: .oceania, isoCode: "AU"),
        Country(name: "Christmas Island", imageName: "Flags/christmas-island", continent: .oceania, isoCode: "CX"),
        Country(name: "Cocos Islands", imageName: "Flags/cocos-islands", continent: .oceania, isoCode: "CC"),
        Country(name: "Cook Islands", imageName: "Flags/cook-islands", continent: .oceania, isoCode: "CK"),
        Country(name: "Fiji", imageName: "Flags/fiji", continent: .oceania, isoCode: "FJ"),
        Country(name: "French Polynesia", imageName: "Flags/french-polynesia", continent: .oceania, isoCode: "PF"),
        Country(name: "Guam", imageName: "Flags/guam", continent: .oceania, isoCode: "GU"),
        Country(name: "Kiribati", imageName: "Flags/kiribati", continent: .oceania, isoCode: "KI"),
        Country(name: "Marshall Islands", imageName: "Flags/marshall-islands", continent: .oceania, isoCode: "MH"),
        Country(name: "Micronesia", imageName: "Flags/micronesia", continent: .oceania, isoCode: "FM"),
        Country(name: "Nauru", imageName: "Flags/nauru", continent: .oceania, isoCode: "NR"),
        Country(name: "New Caledonia", imageName: "Flags/new-caledonia", continent: .oceania, isoCode: "NC"),
        Country(name: "New Zealand", imageName: "Flags/new-zealand", continent: .oceania, isoCode: "NZ"),
        Country(name: "Niue", imageName: "Flags/niue", continent: .oceania, isoCode: "NU"),
        Country(name: "Norfolk Island", imageName: "Flags/norfolk-island", continent: .oceania, isoCode: "NF"),
        Country(name: "Northern Mariana Islands", imageName: "Flags/northern-mariana-islands", continent: .oceania, isoCode: "MP"),
        Country(name: "Palau", imageName: "Flags/palau", continent: .oceania, isoCode: "PW"),
        Country(name: "Papua New Guinea", imageName: "Flags/papua-new-guinea", continent: .oceania, isoCode: "PG"),
        Country(name: "Pitcairn Islands", imageName: "Flags/pitcairn-islands", continent: .oceania, isoCode: "PN"),
        Country(name: "Samoa", imageName: "Flags/samoa", continent: .oceania, isoCode: "WS"),
        Country(name: "Solomon Islands", imageName: "Flags/solomon-islands", continent: .oceania, isoCode: "SB"),
        Country(name: "Tokelau", imageName: "Flags/tokelau", continent: .oceania, isoCode: "TK"),
        Country(name: "Tonga", imageName: "Flags/tonga", continent: .oceania, isoCode: "TO"),
        Country(name: "Tuvalu", imageName: "Flags/tuvalu", continent: .oceania, isoCode: "TV"),
        Country(name: "Vanuatu", imageName: "Flags/vanuatu", continent: .oceania, isoCode: "VU"),
        Country(name: "Wallis and Futuna", imageName: "Flags/wallis-and-futuna", continent: .oceania, isoCode: "WF"),

        // Antarctica
        Country(name: "Antarctica", imageName: "Flags/antarctica", continent: .antarctica, isoCode: "AQ"),
        Country(name: "Bouvet Island", imageName: "Flags/bouvet-island", continent: .antarctica, isoCode: "BV"),
        Country(name: "French Southern Territories", imageName: "Flags/french-southern-territories", continent: .antarctica, isoCode: "TF"),
        Country(name: "Heard Island", imageName: "Flags/heard-island-and-mcdonald-islands", continent: .antarctica, isoCode: "HM"),
        Country(name: "South Georgia", imageName: "Flags/south-georgia-and-south-sandwich-islands", continent: .antarctica, isoCode: "GS"),
    ]

    static func countries(for continent: Continent) -> [Country] {
        if continent == .all {
            return allCountries
        }
        return allCountries.filter { $0.continent == continent }
    }
}

