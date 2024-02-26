import Foundation
import Observation

@Observable
class ProductModel {
    let preferencesModel = PreferencesModel()
    var matchedProducts: [(productName: String, alertTriggeringIngredients: Set<String>)] = []

    func compareIngredients(_ otherIngredients: [String], ingredientTags: [String], productName: String) -> Bool {
        let cleanedOtherIngredients = otherIngredients.map { $0.replacingOccurrences(of: "en:", with: "") }

        let isVegan = isProductVegan(ingredientTags: ingredientTags)
        let isPalmOilFree = isPalmOilFree(ingredientTags: ingredientTags)
        let palmoilInPreference = preferencesModel.selectedIngredients.contains("palm oil")
        let veganInPreference = preferencesModel.selectedIngredients.contains("animal products")

        var alertTriggeringIngredients: Set<String> = []

        if veganInPreference && !isVegan {
            alertTriggeringIngredients.insert("Non-Vegan")
        }

        if palmoilInPreference && !isPalmOilFree {
            alertTriggeringIngredients.insert("Contains Palm Oil")
        }

        let intersection = Set(preferencesModel.selectedIngredients).intersection(cleanedOtherIngredients)

        // Include all triggering ingredients, both from preferences and due to non-vegan or palm oil content
        alertTriggeringIngredients.formUnion(intersection)

        if !alertTriggeringIngredients.isEmpty {
            // If there are alert-triggering ingredients, add the product name and ingredients to the matchedProducts array
            matchedProducts.append((productName: productName, alertTriggeringIngredients: alertTriggeringIngredients))
            return false
        }

        return true
    }


    func isProductVegan(ingredientTags: [String]) -> Bool {
        return !ingredientTags.contains("en:non-vegan")
    }

    func isPalmOilFree(ingredientTags: [String]) -> Bool {
        return !ingredientTags.contains("en:palm-oil")
    }
}
