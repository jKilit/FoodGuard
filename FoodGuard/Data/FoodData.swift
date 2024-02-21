//
//  FoodData.swift
//  FoodGuard
//
//  Created by Jonathan Kilit on 2024-02-13.
//

import Foundation

struct FoodData: Decodable {
    let code: String
    let product: Product
    let status: Int
    let statusVerbose: String

    struct Product: Decodable {
        let ingredientsHierarchy: [String]
        let ingredientsAnalysisTags: [String]
        let productName: String
    }
}
