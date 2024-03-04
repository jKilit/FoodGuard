//
//  HistoryModel.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-03-04.
//

import Foundation
import Observation


struct ScannedProduct: Identifiable, Codable {
    var id = UUID()
    let productName: String
}

@Observable
class HistoryModel {
    let preferencesModel = PreferencesModel()
    var scannedProducts: [ScannedProduct] = [] {
        didSet {
            saveScannedProducts()
        }
    }
    
    private let scannedProductsKey = "ScannedProducts"
    
    init() {
        loadScannedProducts()
    }
    
    func addScannedProduct(productName: String) {
        let scannedProduct = ScannedProduct(productName: productName)
        scannedProducts.append(scannedProduct)
        print("ADD SCANNED !")
    }
    
    func clearHistory() {
        scannedProducts = []
    }
    
    // MARK: - UserDefaults
    
    private func saveScannedProducts() {
        if let encodedData = try? JSONEncoder().encode(scannedProducts) {
            UserDefaults.standard.set(encodedData, forKey: scannedProductsKey)
        }
    }
    
     func loadScannedProducts() {
        if let savedData = UserDefaults.standard.data(forKey: scannedProductsKey),
           let loadedProducts = try? JSONDecoder().decode([ScannedProduct].self, from: savedData) {
            scannedProducts = loadedProducts
        }
    }
}
