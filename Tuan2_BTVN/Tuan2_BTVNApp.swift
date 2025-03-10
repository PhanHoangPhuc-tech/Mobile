//
//  Tuan2_BTVNApp.swift
//  Tuan2_BTVN
//
//  Created by Phan Hoang Phuc on 11/3/25.
//

import SwiftUI
import SwiftData

@main
struct Tuan2_BTVNApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
