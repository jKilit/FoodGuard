import Foundation
import Observation

@Observable
class ProductModel {
    let preferencesModel = PreferencesModel()
    var matchedProducts: [(productName: String, alertTriggeringIngredients: Set<Ingredient>)] = []

    func compareIngredients(_ otherIngredients: [String], ingredientTags: [String], productName: String) -> Bool {
        let cleanedOtherIngredients = otherIngredients.map { $0.replacingOccurrences(of: "en:", with: "") }

        let isVegan = isProductVegan(ingredientTags: ingredientTags)
        let isPalmOilFree = isPalmOilFree(ingredientTags: ingredientTags)
        let isEAdditiveFree = isEAdditiveFree(otherIngredients: otherIngredients)

        let palmoilInPreference = preferencesModel.selectedIngredients.contains(.palmOil)
        let veganInPreference = preferencesModel.selectedIngredients.contains(.animalProducts)
        let eAdditivesInPreference = preferencesModel.selectedIngredients.contains(.eAdditives)

        var alertTriggeringIngredients: Set<Ingredient> = []

        if veganInPreference && !isVegan {
            alertTriggeringIngredients.insert(.animalProducts)
        }

        if palmoilInPreference && !isPalmOilFree {
            alertTriggeringIngredients.insert(.palmOil)
        }

        if eAdditivesInPreference && !isEAdditiveFree {
            alertTriggeringIngredients.insert(.eAdditives)
        }

        let preferenceIngredientsSet: Set<Ingredient> = Set(preferencesModel.selectedIngredients)
        let cleanedOtherIngredientsSet: Set<Ingredient> = Set(cleanedOtherIngredients.compactMap { Ingredient(rawValue: $0) })

        let intersection: Set<Ingredient> = preferenceIngredientsSet.intersection(cleanedOtherIngredientsSet)


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
    func isEAdditiveFree(otherIngredients: [String]) -> Bool {
        let hasEAdditive = otherIngredients.contains { tag in
            let lowercasedTag = tag.lowercased()
            return lowercasedTag.hasPrefix("en:e") && lowercasedTag.dropFirst(4).allSatisfy(\.isNumber)
        }
        return !hasEAdditive
    }
}
