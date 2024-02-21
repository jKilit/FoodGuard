//
//  BarcodeScannerView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import Foundation
import SwiftUI
import SwiftUI

struct BarcodeScannerView: View {
    @State private var API = FoodAPI()
    @State private var isFoodLoaded = false
    @State var viewModel = BarcodeScannerViewModel()
    @State private var isActiveProductView = false
    @State private var productName: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                .edgesIgnoringSafeArea(.all)
            
            // Black overlay
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                
                Text("Place the barcode inside the frame to scan.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Text/Barcode Display
                VStack {
                    Spacer()
                    
                    Text("Place the barcode inside the frame to scan.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    Text("Scanned Barcode:")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                    if isFoodLoaded {
                        // Instead of displaying product details here, show a button to navigate to ProductView
                        NavigationLink(
                            destination: ProductView(productName: productName, ingredients: API.foodModel?.ingredients ?? [], ingredientsTags: API.foodModel?.ingredientsTags ?? []),
                            isActive: $isActiveProductView
                        ) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            productName = API.foodModel?.name ?? "N/A"
                            isActiveProductView = true
                        }) {
                            Text("View Product Details")
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                        .opacity(isFoodLoaded ? 1.0 : 0.0) // Show the button only when food is loaded
                    } else {
                        // Display scanned barcode
                        Text("Scanned Barcode:")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        Text(viewModel.statusText)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                }
                
            }
            
        }
        .onChange(of: viewModel.scannedCode) { newScannedCode in
            // Load food when the barcode is scanned
            Task {
                do {
                    try await API.loadFood(barcode: newScannedCode)
                    isFoodLoaded = true
                } catch {
                    print("Error loading food: \(error)")
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
