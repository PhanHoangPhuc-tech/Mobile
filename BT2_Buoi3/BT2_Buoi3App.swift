//
//  BT2_Buoi3App.swift
//  BT2_Buoi3
//
//  Created by Phan Hoang Phuc on 19/3/25.
//

import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var sharedModelContainer: ModelContainer
    
    init() {
        let schema = Schema([Item.self]) // Đảm bảo rằng Item là model của bạn
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView() // Đảm bảo ContentView được truyền vào đúng
                .modelContainer(sharedModelContainer)
        }
    }
}
