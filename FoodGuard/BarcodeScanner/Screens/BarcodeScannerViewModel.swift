//
//  BarcodeScannerViewModel.swift
//  FoodGuard
//
//  Created by Edin Nasic on 2024-02-10.
//

import Foundation
import SwiftUI
import Observation


@Observable
final class BarcodeScannerViewModel {

    var scannedCode = ""
    var alertItem: AlertItem?

    var statusText: String {
        scannedCode.isEmpty ? "Scan a code" : scannedCode
    }

    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
