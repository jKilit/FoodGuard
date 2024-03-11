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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: HistoryData.self)
    }
}
