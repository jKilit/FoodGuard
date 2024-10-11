import Foundation 
import Observation


@Observable
class FoodModel {
    let name : String
    let ingredients : [String]
    let ingredientsTags: [String]
    
    init(product: FoodData.Product, baseUrl: String) {
        ingredients = product.ingredientsHierarchy
        name = product.productName
        ingredientsTags=product.ingredientsAnalysisTags
    }
}
