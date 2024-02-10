//
//  FoodGuardApp.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import SwiftUI
import SwiftData

@main
struct FoodGuardApp: App {
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
            BarcodeScannerView()
        }
        .modelContainer(sharedModelContainer)
    }
}
