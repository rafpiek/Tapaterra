import SwiftUI

enum Continent: String, CaseIterable {
    case all = "All"
    case africa = "Africa"
    case asia = "Asia"
    case europe = "Europe"
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

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let continent: Continent

    var flagImage: Image {
        Image(imageName)
    }
}

struct FlagData {
    static let allCountries: [Country] = [
        // Africa
        Country(name: "Algeria", imageName: "Flags/algeria", continent: .africa),
        Country(name: "Angola", imageName: "Flags/angola", continent: .africa),
        Country(name: "Benin", imageName: "Flags/benin", continent: .africa),
        Country(name: "Botswana", imageName: "Flags/botswana", continent: .africa),
        Country(name: "Burkina Faso", imageName: "Flags/burkina-faso", continent: .africa),
        Country(name: "Burundi", imageName: "Flags/burundi", continent: .africa),
        Country(name: "Cabo Verde", imageName: "Flags/cabo-verde", continent: .africa),
        Country(name: "Cameroon", imageName: "Flags/cameroon", continent: .africa),
        Country(name: "Central African Republic", imageName: "Flags/central-african-republic", continent: .africa),
        Country(name: "Chad", imageName: "Flags/chad", continent: .africa),
        Country(name: "Comoros", imageName: "Flags/comoros", continent: .africa),
        Country(name: "Congo", imageName: "Flags/congo", continent: .africa),
        Country(name: "DR Congo", imageName: "Flags/congo-democratic-republic", continent: .africa),
        Country(name: "Côte d'Ivoire", imageName: "Flags/cote-divoire", continent: .africa),
        Country(name: "Djibouti", imageName: "Flags/djibouti", continent: .africa),
        Country(name: "Egypt", imageName: "Flags/egypt", continent: .africa),
        Country(name: "Equatorial Guinea", imageName: "Flags/equatorial-guinea", continent: .africa),
        Country(name: "Eritrea", imageName: "Flags/eritrea", continent: .africa),
        Country(name: "Eswatini", imageName: "Flags/eswatini", continent: .africa),
        Country(name: "Ethiopia", imageName: "Flags/ethiopia", continent: .africa),
        Country(name: "Gabon", imageName: "Flags/gabon", continent: .africa),
        Country(name: "Gambia", imageName: "Flags/gambia", continent: .africa),
        Country(name: "Ghana", imageName: "Flags/ghana", continent: .africa),
        Country(name: "Guinea", imageName: "Flags/guinea", continent: .africa),
        Country(name: "Guinea-Bissau", imageName: "Flags/guinea-bissau", continent: .africa),
        Country(name: "Kenya", imageName: "Flags/kenya", continent: .africa),
        Country(name: "Lesotho", imageName: "Flags/lesotho", continent: .africa),
        Country(name: "Liberia", imageName: "Flags/liberia", continent: .africa),
        Country(name: "Libya", imageName: "Flags/libya", continent: .africa),
        Country(name: "Madagascar", imageName: "Flags/madagascar", continent: .africa),
        Country(name: "Malawi", imageName: "Flags/malawi", continent: .africa),
        Country(name: "Mali", imageName: "Flags/mali", continent: .africa),
        Country(name: "Mauritania", imageName: "Flags/mauritania", continent: .africa),
        Country(name: "Mauritius", imageName: "Flags/mauritius", continent: .africa),
        Country(name: "Mayotte", imageName: "Flags/mayotte", continent: .africa),
        Country(name: "Morocco", imageName: "Flags/morocco", continent: .africa),
        Country(name: "Mozambique", imageName: "Flags/mozambique", continent: .africa),
        Country(name: "Namibia", imageName: "Flags/namibia", continent: .africa),
        Country(name: "Niger", imageName: "Flags/niger", continent: .africa),
        Country(name: "Nigeria", imageName: "Flags/nigeria", continent: .africa),
        Country(name: "Réunion", imageName: "Flags/reunion", continent: .africa),
        Country(name: "Rwanda", imageName: "Flags/rwanda", continent: .africa),
        Country(name: "Saint Helena", imageName: "Flags/saint-helena", continent: .africa),
        Country(name: "São Tomé and Príncipe", imageName: "Flags/sao-tome-and-principe", continent: .africa),
        Country(name: "Senegal", imageName: "Flags/senegal", continent: .africa),
        Country(name: "Seychelles", imageName: "Flags/seychelles", continent: .africa),
        Country(name: "Sierra Leone", imageName: "Flags/sierra-leone", continent: .africa),
        Country(name: "Somalia", imageName: "Flags/somalia", continent: .africa),
        Country(name: "South Africa", imageName: "Flags/south-africa", continent: .africa),
        Country(name: "South Sudan", imageName: "Flags/south-sudan", continent: .africa),
        Country(name: "Sudan", imageName: "Flags/sudan", continent: .africa),
        Country(name: "Tanzania", imageName: "Flags/tanzania", continent: .africa),
        Country(name: "Togo", imageName: "Flags/togo", continent: .africa),
        Country(name: "Tunisia", imageName: "Flags/tunisia", continent: .africa),
        Country(name: "Uganda", imageName: "Flags/uganda", continent: .africa),
        Country(name: "Western Sahara", imageName: "Flags/western-sahara", continent: .africa),
        Country(name: "Zambia", imageName: "Flags/zambia", continent: .africa),
        Country(name: "Zimbabwe", imageName: "Flags/zimbabwe", continent: .africa),

        // Asia
        Country(name: "Afghanistan", imageName: "Flags/afghanistan", continent: .asia),
        Country(name: "Armenia", imageName: "Flags/armenia", continent: .asia),
        Country(name: "Azerbaijan", imageName: "Flags/azerbaijan", continent: .asia),
        Country(name: "Bahrain", imageName: "Flags/bahrain", continent: .asia),
        Country(name: "Bangladesh", imageName: "Flags/bangladesh", continent: .asia),
        Country(name: "Bhutan", imageName: "Flags/bhutan", continent: .asia),
        Country(name: "Brunei", imageName: "Flags/brunei", continent: .asia),
        Country(name: "Cambodia", imageName: "Flags/cambodia", continent: .asia),
        Country(name: "China", imageName: "Flags/china", continent: .asia),
        Country(name: "Cyprus", imageName: "Flags/cyprus", continent: .asia),
        Country(name: "Georgia", imageName: "Flags/georgia", continent: .asia),
        Country(name: "Hong Kong", imageName: "Flags/hong-kong", continent: .asia),
        Country(name: "India", imageName: "Flags/india", continent: .asia),
        Country(name: "Indonesia", imageName: "Flags/indonesia", continent: .asia),
        Country(name: "Iran", imageName: "Flags/iran", continent: .asia),
        Country(name: "Iraq", imageName: "Flags/iraq", continent: .asia),
        Country(name: "Israel", imageName: "Flags/israel", continent: .asia),
        Country(name: "Japan", imageName: "Flags/japan", continent: .asia),
        Country(name: "Jordan", imageName: "Flags/jordan", continent: .asia),
        Country(name: "Kazakhstan", imageName: "Flags/kazakhstan", continent: .asia),
        Country(name: "Kuwait", imageName: "Flags/kuwait", continent: .asia),
        Country(name: "Kyrgyzstan", imageName: "Flags/kyrgyzstan", continent: .asia),
        Country(name: "Laos", imageName: "Flags/laos", continent: .asia),
        Country(name: "Lebanon", imageName: "Flags/lebanon", continent: .asia),
        Country(name: "Macao", imageName: "Flags/macao", continent: .asia),
        Country(name: "Malaysia", imageName: "Flags/malaysia", continent: .asia),
        Country(name: "Maldives", imageName: "Flags/maldives", continent: .asia),
        Country(name: "Mongolia", imageName: "Flags/mongolia", continent: .asia),
        Country(name: "Myanmar", imageName: "Flags/myanmar", continent: .asia),
        Country(name: "Nepal", imageName: "Flags/nepal", continent: .asia),
        Country(name: "North Korea", imageName: "Flags/north-korea", continent: .asia),
        Country(name: "Oman", imageName: "Flags/oman", continent: .asia),
        Country(name: "Pakistan", imageName: "Flags/pakistan", continent: .asia),
        Country(name: "Palestine", imageName: "Flags/palestine", continent: .asia),
        Country(name: "Philippines", imageName: "Flags/philippines", continent: .asia),
        Country(name: "Qatar", imageName: "Flags/qatar", continent: .asia),
        Country(name: "Saudi Arabia", imageName: "Flags/saudi-arabia", continent: .asia),
        Country(name: "Singapore", imageName: "Flags/singapore", continent: .asia),
        Country(name: "South Korea", imageName: "Flags/south-korea", continent: .asia),
        Country(name: "Sri Lanka", imageName: "Flags/sri-lanka", continent: .asia),
        Country(name: "Syria", imageName: "Flags/syria", continent: .asia),
        Country(name: "Taiwan", imageName: "Flags/taiwan", continent: .asia),
        Country(name: "Tajikistan", imageName: "Flags/tajikistan", continent: .asia),
        Country(name: "Thailand", imageName: "Flags/thailand", continent: .asia),
        Country(name: "Timor-Leste", imageName: "Flags/timor-leste", continent: .asia),
        Country(name: "Turkey", imageName: "Flags/turkey", continent: .asia),
        Country(name: "Turkmenistan", imageName: "Flags/turkmenistan", continent: .asia),
        Country(name: "UAE", imageName: "Flags/united-arab-emirates", continent: .asia),
        Country(name: "Uzbekistan", imageName: "Flags/uzbekistan", continent: .asia),
        Country(name: "Vietnam", imageName: "Flags/vietnam", continent: .asia),
        Country(name: "Yemen", imageName: "Flags/yemen", continent: .asia),

        // Europe
        Country(name: "Åland Islands", imageName: "Flags/aland-islands", continent: .europe),
        Country(name: "Albania", imageName: "Flags/albania", continent: .europe),
        Country(name: "Andorra", imageName: "Flags/andorra", continent: .europe),
        Country(name: "Austria", imageName: "Flags/austria", continent: .europe),
        Country(name: "Belarus", imageName: "Flags/belarus", continent: .europe),
        Country(name: "Belgium", imageName: "Flags/belgium", continent: .europe),
        Country(name: "Bosnia and Herzegovina", imageName: "Flags/bosnia-and-herzegovina", continent: .europe),
        Country(name: "Bulgaria", imageName: "Flags/bulgaria", continent: .europe),
        Country(name: "Croatia", imageName: "Flags/croatia", continent: .europe),
        Country(name: "Czechia", imageName: "Flags/czechia", continent: .europe),
        Country(name: "Denmark", imageName: "Flags/denmark", continent: .europe),
        Country(name: "Estonia", imageName: "Flags/estonia", continent: .europe),
        Country(name: "Faroe Islands", imageName: "Flags/faroe-islands", continent: .europe),
        Country(name: "Finland", imageName: "Flags/finland", continent: .europe),
        Country(name: "France", imageName: "Flags/france", continent: .europe),
        Country(name: "Germany", imageName: "Flags/germany", continent: .europe),
        Country(name: "Gibraltar", imageName: "Flags/gibraltar", continent: .europe),
        Country(name: "Greece", imageName: "Flags/greece", continent: .europe),
        Country(name: "Guernsey", imageName: "Flags/guernsey", continent: .europe),
        Country(name: "Hungary", imageName: "Flags/hungary", continent: .europe),
        Country(name: "Iceland", imageName: "Flags/iceland", continent: .europe),
        Country(name: "Ireland", imageName: "Flags/ireland", continent: .europe),
        Country(name: "Isle of Man", imageName: "Flags/isle-of-man", continent: .europe),
        Country(name: "Italy", imageName: "Flags/italy", continent: .europe),
        Country(name: "Jersey", imageName: "Flags/jersey", continent: .europe),
        Country(name: "Kosovo", imageName: "Flags/kosovo", continent: .europe),
        Country(name: "Latvia", imageName: "Flags/latvia", continent: .europe),
        Country(name: "Liechtenstein", imageName: "Flags/liechtenstein", continent: .europe),
        Country(name: "Lithuania", imageName: "Flags/lithuania", continent: .europe),
        Country(name: "Luxembourg", imageName: "Flags/luxembourg", continent: .europe),
        Country(name: "Malta", imageName: "Flags/malta", continent: .europe),
        Country(name: "Moldova", imageName: "Flags/moldova", continent: .europe),
        Country(name: "Monaco", imageName: "Flags/monaco", continent: .europe),
        Country(name: "Montenegro", imageName: "Flags/montenegro", continent: .europe),
        Country(name: "Netherlands", imageName: "Flags/netherlands", continent: .europe),
        Country(name: "North Macedonia", imageName: "Flags/north-macedonia", continent: .europe),
        Country(name: "Norway", imageName: "Flags/norway", continent: .europe),
        Country(name: "Poland", imageName: "Flags/poland", continent: .europe),
        Country(name: "Portugal", imageName: "Flags/portugal", continent: .europe),
        Country(name: "Romania", imageName: "Flags/romania", continent: .europe),
        Country(name: "Russia", imageName: "Flags/russia", continent: .europe),
        Country(name: "San Marino", imageName: "Flags/san-marino", continent: .europe),
        Country(name: "Serbia", imageName: "Flags/serbia", continent: .europe),
        Country(name: "Slovakia", imageName: "Flags/slovakia", continent: .europe),
        Country(name: "Slovenia", imageName: "Flags/slovenia", continent: .europe),
        Country(name: "Spain", imageName: "Flags/spain", continent: .europe),
        Country(name: "Svalbard and Jan Mayen", imageName: "Flags/svalbard-and-jan-mayen", continent: .europe),
        Country(name: "Sweden", imageName: "Flags/sweden", continent: .europe),
        Country(name: "Switzerland", imageName: "Flags/switzerland", continent: .europe),
        Country(name: "Ukraine", imageName: "Flags/ukraine", continent: .europe),
        Country(name: "United Kingdom", imageName: "Flags/united-kingdom", continent: .europe),
        Country(name: "Vatican City", imageName: "Flags/vatican-city", continent: .europe),

        // North America
        Country(name: "Anguilla", imageName: "Flags/anguilla", continent: .northAmerica),
        Country(name: "Antigua and Barbuda", imageName: "Flags/antigua-and-barbuda", continent: .northAmerica),
        Country(name: "Aruba", imageName: "Flags/aruba", continent: .northAmerica),
        Country(name: "Bahamas", imageName: "Flags/bahamas", continent: .northAmerica),
        Country(name: "Barbados", imageName: "Flags/barbados", continent: .northAmerica),
        Country(name: "Belize", imageName: "Flags/belize", continent: .northAmerica),
        Country(name: "Bermuda", imageName: "Flags/bermuda", continent: .northAmerica),
        Country(name: "Bonaire", imageName: "Flags/bonaire-sint-eustatius-and-saba", continent: .northAmerica),
        Country(name: "British Virgin Islands", imageName: "Flags/british-virgin-islands", continent: .northAmerica),
        Country(name: "Canada", imageName: "Flags/canada", continent: .northAmerica),
        Country(name: "Cayman Islands", imageName: "Flags/cayman-islands", continent: .northAmerica),
        Country(name: "Costa Rica", imageName: "Flags/costa-rica", continent: .northAmerica),
        Country(name: "Cuba", imageName: "Flags/cuba", continent: .northAmerica),
        Country(name: "Curaçao", imageName: "Flags/curacao", continent: .northAmerica),
        Country(name: "Dominica", imageName: "Flags/dominica", continent: .northAmerica),
        Country(name: "Dominican Republic", imageName: "Flags/dominican-republic", continent: .northAmerica),
        Country(name: "El Salvador", imageName: "Flags/el-salvador", continent: .northAmerica),
        Country(name: "Greenland", imageName: "Flags/greenland", continent: .northAmerica),
        Country(name: "Grenada", imageName: "Flags/grenada", continent: .northAmerica),
        Country(name: "Guadeloupe", imageName: "Flags/guadeloupe", continent: .northAmerica),
        Country(name: "Guatemala", imageName: "Flags/guatemala", continent: .northAmerica),
        Country(name: "Haiti", imageName: "Flags/haiti", continent: .northAmerica),
        Country(name: "Honduras", imageName: "Flags/honduras", continent: .northAmerica),
        Country(name: "Jamaica", imageName: "Flags/jamaica", continent: .northAmerica),
        Country(name: "Martinique", imageName: "Flags/martinique", continent: .northAmerica),
        Country(name: "Mexico", imageName: "Flags/mexico", continent: .northAmerica),
        Country(name: "Montserrat", imageName: "Flags/montserrat", continent: .northAmerica),
        Country(name: "Nicaragua", imageName: "Flags/nicaragua", continent: .northAmerica),
        Country(name: "Panama", imageName: "Flags/panama", continent: .northAmerica),
        Country(name: "Puerto Rico", imageName: "Flags/puerto-rico", continent: .northAmerica),
        Country(name: "Saint Barthélemy", imageName: "Flags/saint-barthelemy", continent: .northAmerica),
        Country(name: "Saint Kitts and Nevis", imageName: "Flags/saint-kitts-and-nevis", continent: .northAmerica),
        Country(name: "Saint Lucia", imageName: "Flags/saint-lucia", continent: .northAmerica),
        Country(name: "Saint Martin", imageName: "Flags/saint-martin", continent: .northAmerica),
        Country(name: "Saint Pierre and Miquelon", imageName: "Flags/saint-pierre-and-miquelon", continent: .northAmerica),
        Country(name: "Saint Vincent", imageName: "Flags/saint-vincent-and-the-grenadines", continent: .northAmerica),
        Country(name: "Sint Maarten", imageName: "Flags/sint-maarten", continent: .northAmerica),
        Country(name: "Trinidad and Tobago", imageName: "Flags/trinidad-and-tobago", continent: .northAmerica),
        Country(name: "Turks and Caicos", imageName: "Flags/turks-and-caicos-islands", continent: .northAmerica),
        Country(name: "United States", imageName: "Flags/united-states", continent: .northAmerica),
        Country(name: "US Virgin Islands", imageName: "Flags/us-virgin-islands", continent: .northAmerica),

        // South America
        Country(name: "Argentina", imageName: "Flags/argentina", continent: .southAmerica),
        Country(name: "Bolivia", imageName: "Flags/bolivia", continent: .southAmerica),
        Country(name: "Brazil", imageName: "Flags/brazil", continent: .southAmerica),
        Country(name: "Chile", imageName: "Flags/chile", continent: .southAmerica),
        Country(name: "Colombia", imageName: "Flags/colombia", continent: .southAmerica),
        Country(name: "Ecuador", imageName: "Flags/ecuador", continent: .southAmerica),
        Country(name: "Falkland Islands", imageName: "Flags/falkland-islands", continent: .southAmerica),
        Country(name: "French Guiana", imageName: "Flags/french-guiana", continent: .southAmerica),
        Country(name: "Guyana", imageName: "Flags/guyana", continent: .southAmerica),
        Country(name: "Paraguay", imageName: "Flags/paraguay", continent: .southAmerica),
        Country(name: "Peru", imageName: "Flags/peru", continent: .southAmerica),
        Country(name: "Suriname", imageName: "Flags/suriname", continent: .southAmerica),
        Country(name: "Uruguay", imageName: "Flags/uruguay", continent: .southAmerica),
        Country(name: "Venezuela", imageName: "Flags/venezuela", continent: .southAmerica),

        // Oceania
        Country(name: "American Samoa", imageName: "Flags/american-samoa", continent: .oceania),
        Country(name: "Australia", imageName: "Flags/australia", continent: .oceania),
        Country(name: "Christmas Island", imageName: "Flags/christmas-island", continent: .oceania),
        Country(name: "Cocos Islands", imageName: "Flags/cocos-islands", continent: .oceania),
        Country(name: "Cook Islands", imageName: "Flags/cook-islands", continent: .oceania),
        Country(name: "Fiji", imageName: "Flags/fiji", continent: .oceania),
        Country(name: "French Polynesia", imageName: "Flags/french-polynesia", continent: .oceania),
        Country(name: "Guam", imageName: "Flags/guam", continent: .oceania),
        Country(name: "Kiribati", imageName: "Flags/kiribati", continent: .oceania),
        Country(name: "Marshall Islands", imageName: "Flags/marshall-islands", continent: .oceania),
        Country(name: "Micronesia", imageName: "Flags/micronesia", continent: .oceania),
        Country(name: "Nauru", imageName: "Flags/nauru", continent: .oceania),
        Country(name: "New Caledonia", imageName: "Flags/new-caledonia", continent: .oceania),
        Country(name: "New Zealand", imageName: "Flags/new-zealand", continent: .oceania),
        Country(name: "Niue", imageName: "Flags/niue", continent: .oceania),
        Country(name: "Norfolk Island", imageName: "Flags/norfolk-island", continent: .oceania),
        Country(name: "Northern Mariana Islands", imageName: "Flags/northern-mariana-islands", continent: .oceania),
        Country(name: "Palau", imageName: "Flags/palau", continent: .oceania),
        Country(name: "Papua New Guinea", imageName: "Flags/papua-new-guinea", continent: .oceania),
        Country(name: "Pitcairn Islands", imageName: "Flags/pitcairn-islands", continent: .oceania),
        Country(name: "Samoa", imageName: "Flags/samoa", continent: .oceania),
        Country(name: "Solomon Islands", imageName: "Flags/solomon-islands", continent: .oceania),
        Country(name: "Tokelau", imageName: "Flags/tokelau", continent: .oceania),
        Country(name: "Tonga", imageName: "Flags/tonga", continent: .oceania),
        Country(name: "Tuvalu", imageName: "Flags/tuvalu", continent: .oceania),
        Country(name: "Vanuatu", imageName: "Flags/vanuatu", continent: .oceania),
        Country(name: "Wallis and Futuna", imageName: "Flags/wallis-and-futuna", continent: .oceania),

        // Antarctica
        Country(name: "Antarctica", imageName: "Flags/antarctica", continent: .antarctica),
        Country(name: "Bouvet Island", imageName: "Flags/bouvet-island", continent: .antarctica),
        Country(name: "French Southern Territories", imageName: "Flags/french-southern-territories", continent: .antarctica),
        Country(name: "Heard Island", imageName: "Flags/heard-island-and-mcdonald-islands", continent: .antarctica),
        Country(name: "South Georgia", imageName: "Flags/south-georgia-and-south-sandwich-islands", continent: .antarctica),
    ]

    static func countries(for continent: Continent) -> [Country] {
        if continent == .all {
            return allCountries
        }
        return allCountries.filter { $0.continent == continent }
    }
}

