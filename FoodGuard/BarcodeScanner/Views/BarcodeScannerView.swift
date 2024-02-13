//
//  BarcodeScannerView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import Foundation
import SwiftUI
import SwiftUI

enum Tab {
    case home, screen2, scanner, screen4, screen5
}

struct BarcodeScannerView: View {
    @State private var API = FoodAPI()
    @State private var isFoodLoaded = false
    
    @State private var selectedTab: Tab = .scanner
    @State var viewModel = BarcodeScannerViewModel()

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                // Camera Screen
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .edgesIgnoringSafeArea(.all)

                // Black overlay
                Color.black.opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                // Overlay
                VStack {
                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
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

                BottomNavigationBar(selectedTab: $selectedTab)
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
            .navigationBarTitle("Scanner", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
