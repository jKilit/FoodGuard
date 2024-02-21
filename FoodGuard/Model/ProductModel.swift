import Foundation
import Observation

@Observable
class ProductModel {
    let preferencesModel = PreferencesModel()
    var matchedProducts: [String] = []
    
    func compareIngredients(_ otherIngredients: [String], ingredientTags: [String], productName: String) -> Bool {
        let cleanedOtherIngredients = otherIngredients.map { $0.replacingOccurrences(of: "en:", with: "") }
        
        let intersection = Set(preferencesModel.selectedIngredients).intersection(cleanedOtherIngredients)
        
        let isVegan = isProductVegan(ingredientTags: ingredientTags)
        let isPalmOilFree = isPalmOilFree(ingredientTags: ingredientTags)
        let palmoilInPreference = preferencesModel.selectedIngredients.contains("palm oil")
        let veganInPreference = preferencesModel.selectedIngredients.contains("animal products")
        
        if veganInPreference && !isVegan {
            return false
        }
        if palmoilInPreference && !isPalmOilFree{
            return false
        }
        else if !intersection.isEmpty {
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
