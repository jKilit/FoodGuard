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
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .background(Color.black)

                VStack(spacing: 20) {
                    Spacer()

                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding()

                    Text("Place the barcode inside the frame to scan.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()

                    Text("Scanned Barcode:")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    Text(viewModel.statusText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(16)
                .shadow(radius: 5)

                Spacer()
            }
            .navigationTitle("Scanner")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
