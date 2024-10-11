import Foundation
import Observation

@Observable
class FoodAPI {
    var foodModel: FoodModel?
    
    func loadFood(barcode: String) async throws {
        
        let baseUrl = "https://world.openfoodfacts.org/api/v2/"
        let foodUrl = "product/\(barcode)?fields=product_name,ingredients_hierarchy,ingredients_analysis_tags"
        
        print("1")
        
        guard let url = URL(string: baseUrl + foodUrl) else {
            return
        }
        print("2")
        
        do {
            // Use async/await here if your Swift version supports it
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let foodInfo = try decoder.decode(FoodData.self, from: data)
            foodModel = FoodModel(product: foodInfo.product, baseUrl: baseUrl)
            print(foodInfo)
        } catch {
            print(error)
        }
    }
}


