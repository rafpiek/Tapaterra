import SwiftUI

struct FlagPreviewView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Flag Assets Preview")
                    .font(.title)
                    .padding()

                // Africa
                VStack(alignment: .leading) {
                    Text("Africa").font(.headline)
                    HStack {
                        FlagAssets.Africa.algeria.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Africa.egypt.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Africa.kenya.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Africa.southAfrica.resizable().scaledToFit().frame(height: 40)
                    }
                }

                // Europe
                VStack(alignment: .leading) {
                    Text("Europe").font(.headline)
                    HStack {
                        FlagAssets.Europe.france.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Europe.germany.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Europe.italy.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Europe.unitedKingdom.resizable().scaledToFit().frame(height: 40)
                    }
                }

                // Asia
                VStack(alignment: .leading) {
                    Text("Asia").font(.headline)
                    HStack {
                        FlagAssets.Asia.japan.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Asia.southKorea.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Asia.india.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.Asia.china.resizable().scaledToFit().frame(height: 40)
                    }
                }

                // Americas
                VStack(alignment: .leading) {
                    Text("Americas").font(.headline)
                    HStack {
                        FlagAssets.NorthAmerica.unitedStates.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.NorthAmerica.canada.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.SouthAmerica.brazil.resizable().scaledToFit().frame(height: 40)
                        FlagAssets.SouthAmerica.argentina.resizable().scaledToFit().frame(height: 40)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Flags")
    }
}

#Preview {
    FlagPreviewView()
}


