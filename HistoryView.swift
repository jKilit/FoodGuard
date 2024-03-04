//
//  HistoryView.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-03-04.
//

import SwiftUI

struct ProductHistoryView: View {
    @State private var historyModel = HistoryModel()

    var body: some View {
        NavigationView {
            List(historyModel.scannedProducts) { scannedProduct in
                VStack(alignment: .leading) {
                    Text(scannedProduct.productName)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            .navigationBarTitle("Product History")
            .navigationBarItems(trailing:
                Button("Clear History") {
                    historyModel.clearHistory()
                }
            )
        }
        .onAppear {
            // Load initial data when the view appears
            historyModel.loadScannedProducts()
        }
    }
}
