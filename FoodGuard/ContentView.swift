//
//  ContentView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var API = FoodAPI()
    
    var body: some View {
            VStack {
                if let foodModel = API.foodModel {
                    Text("Product name: \(foodModel.name)")
                } else {
                    Text("Loading...")
                }
            }
        }
    }

// Use Preview instead of #Preview
#Preview {
    ContentView()
}
