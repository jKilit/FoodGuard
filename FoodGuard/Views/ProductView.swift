//
//  ProductView.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//

import SwiftUI

struct ProductView: View {
    let productName: String

    var body: some View {
        VStack {
            Text("Product name: \(productName)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            // Add more views details here...
        }
        .background(Color.black.opacity(0.7))
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding()
        .navigationTitle("Product Details")
    }
}
