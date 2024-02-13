//
//  PreferencesModel.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//

import Foundation
import Observation

@Observable
class PreferencesModel {
    var selectedIngredients: Set<String> = []

    func toggleIngredient(_ ingredient: String) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
}
