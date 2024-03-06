//
//  PreferencesModel.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//

import Foundation
import Observation


enum Ingredient: String, CaseIterable, Codable, Comparable {
    case lactose, sugar, eggs, nuts, gluten, soy, fish, animalProducts, palmOil, eAdditives

    var displayName: String {
        switch self {
        case .animalProducts:
            return "Animal Products"
        case .palmOil:
            return "Palm Oil"
        case .eAdditives:
            return "E-additives"
        default:
            return rawValue.capitalized
        }
    }

    // Implement the Comparable conformance
    static func < (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
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
        let ingredientStrings = selectedIngredients.map { $0.rawValue }
        UserDefaults.standard.set(ingredientStrings, forKey: "selectedIngredients")
    }

    private func loadPreferences() {
        if let savedIngredients = UserDefaults.standard.array(forKey: "selectedIngredients") as? [String] {
            selectedIngredients = Set(savedIngredients.compactMap{ Ingredient(rawValue: $0) })
        }
    }
}
