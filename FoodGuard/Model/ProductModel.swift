//
//  ProductModel.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-02-14.
//

import Foundation
import Observation

@Observable
class ProductModel {
    let preferencesModel = PreferencesModel()
    var matchedProducts: [String] = []

    func compareIngredients(_ otherIngredients: [String], productName: String) -> Bool {
        let intersection = Set(preferencesModel.selectedIngredients).intersection(otherIngredients)
        
        if !intersection.isEmpty {
            // If there's a match, add the product name to the matchedProducts array
            matchedProducts.append(productName)
        }
        
        return intersection.isEmpty
    }
}

