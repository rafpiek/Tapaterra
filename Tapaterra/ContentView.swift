//
//  ContentView.swift
//  Tapaterra
//
//  Created by Rafał Piekara on 26/11/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    FlagPreviewView()
                } label: {
                    Label("content.preview_flags".localized, systemImage: "flag.fill")
                }

                ForEach(items) { item in
                    NavigationLink {
                        Text("content.item_at".localized + " \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)

                // Language switching section
                Section("content.change_language".localized) {
                    VStack(spacing: 16) {
                        HStack {
                            Text("content.language".localized)
                                .font(.headline)
                            Spacer()
                            Text(languageManager.currentLanguage == "en" ? "English" : "Polski")
                                .foregroundColor(.secondary)
                        }

                        HStack(spacing: 12) {
                            Button(action: {
                                languageManager.setLanguage("en")
                                currentLanguageManager = languageManager
                            }) {
                                HStack {
                                    Image(systemName: "globe")
                                    Text("content.english".localized)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(languageManager.currentLanguage == "en" ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(languageManager.currentLanguage == "en" ? .white : .primary)
                                .cornerRadius(8)
                            }

                            Button(action: {
                                languageManager.setLanguage("pl")
                                currentLanguageManager = languageManager
                            }) {
                                HStack {
                                    Image(systemName: "globe")
                                    Text("content.polish".localized)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(languageManager.currentLanguage == "pl" ? Color.red : Color.gray.opacity(0.2))
                                .foregroundColor(languageManager.currentLanguage == "pl" ? .white : .primary)
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("content.add_item".localized, systemImage: "plus")
                    }
                }
            }
        }
        .onAppear {
            currentLanguageManager = languageManager
        }
        .onChange(of: languageManager.currentLanguage) { _, _ in
            currentLanguageManager = languageManager
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}