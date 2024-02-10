//
//  BarcodeScannerView.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import Foundation
import SwiftUI

struct BarcodeScannerView: View {
    @State var viewModel = BarcodeScannerViewModel()

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                // Camera Screen
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .edgesIgnoringSafeArea(.all)

                // Overlay
                VStack {
                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .padding()

                    Spacer()

                    // Text/Barcode Display
                    VStack {
                        Text("Place the barcode inside the frame to scan.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        VStack {
                            Text("Scanned Barcode:")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()

                            Text(viewModel.statusText)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .bottom) // Ensure it extends to the edges
                        }
                        .background(Color.black)
                    }
                }
            }
            .navigationBarTitle("FoodGuard Scanner", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
