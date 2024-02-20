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
                
                Spacer(minLength: 200)
                
                VStack{
                    Image(systemName: "viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .padding()
                    
            
                    VStack {
                        Spacer()
                        if isFoodLoaded {
                            // Display product name when food is loaded
                            Text("Product name: \(API.foodModel?.name ?? "N/A")")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
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
                    .frame(maxWidth: .infinity)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
