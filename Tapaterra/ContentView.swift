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
    @State private var langManager = LanguageManager.shared

    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    FlagPreviewView()
                } label: {
                    Label(L10n.get("preview_flags"), systemImage: "flag.fill")
                }

                ForEach(items) { item in
                    NavigationLink {
                        Text("\(L10n.get("item_at")) \(item.timestamp.formatted())")
                    } label: {
                        Text(item.timestamp.formatted(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)

                Section(L10n.get("change_language")) {
                    LanguagePicker()
                }
            }
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                #endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label(L10n.get("add_item"), systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            modelContext.insert(Item(timestamp: Date()))
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

struct LanguagePicker: View {
    @State private var langManager = LanguageManager.shared

    var body: some View {
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
                    .padding(.vertical, 12)
                    .background(langManager.currentLanguage == lang ? Color.accentColor : Color.gray.opacity(0.2))
                    .foregroundStyle(langManager.currentLanguage == lang ? .white : .primary)
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
