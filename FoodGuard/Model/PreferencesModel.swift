//
//  PreferencesModel.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//

import Foundation
import Observation

// enum for ingredients
enum Ingredient: String, CaseIterable, Hashable {
    case lactose
    case sugar
    case eggs
    case nuts
    case gluten
    case soy
    case fish
    case animalProducts = "animal products"
    case palmOil = "palm oil"
    case eAdditives = "E-additives"
}

@Observable
class PreferencesModel {
    var selectedIngredients: Set<Ingredient> = []

    init() {
        loadPreferences()
    }

    func toggleIngredient(_ ingredient: Ingredient) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
        savePreferences()
    }

    private func savePreferences() {
        UserDefaults.standard.set(Array(selectedIngredients), forKey: "selectedIngredients")
    }

    private func loadPreferences() {
        if let savedIngredients = UserDefaults.standard.array(forKey: "selectedIngredients") as? [String] {
            selectedIngredients = Set(savedIngredients.compactMap(Ingredient.init(rawValue:)))
        }
    }
}

