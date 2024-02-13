//
//  APIManager.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-02-13.
//
import Foundation
import Observation

@Observable
class FoodAPI {
    var foodModel: FoodModel?

    func loadFood(barcode: String) async throws {
        
        let baseUrl = "https://world.openfoodfacts.net/api/v2/"
        
        
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let foodInfo = try decoder.decode(FoodData.self, from: data)
            foodModel = FoodModel(product: foodInfo.product, baseUrl: baseUrl)
            
            print(foodInfo)
            print("LOADED FOOD!!")
        } catch {
            print(error)
        }
    }
}

