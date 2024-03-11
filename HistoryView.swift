//
//  HistoryView.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-03-04.
//

import SwiftUI
import SwiftData

struct ProductHistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var historyProducts: [HistoryData]
    
    var body: some View {
        NavigationView {
            List(historyProducts) { scannedProduct in
                VStack(alignment: .leading) {
                    Text(scannedProduct.productName)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            .navigationBarTitle("Product History")
            .navigationBarItems(trailing:
                                    Button("Clear History") {
                // historyModel.clearHistory()
            }
            )
        }
        .onAppear {
            // Load initial data when the view appearsq
            // historyModel.loadScannedProducts()
        }
    }
}

