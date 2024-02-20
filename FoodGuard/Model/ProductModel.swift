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

    func compareIngredients(_ otherIngredients: [String]) -> Bool {
        return preferencesModel.selectedIngredients.elementsEqual(otherIngredients)

    }

}
