//
//  FoodModelTests.swift
//  FoodGuardTests
//
//  Created by Jonathan Kilit on 2024-03-13.
//

import XCTest
@testable import FoodGuard

class FoodModelTests: XCTestCase {
    func testFoodModelInitialization() {
        
        let product = FoodData.Product(ingredientsHierarchy: ["Ingredient1", "Ingredient2"], ingredientsAnalysisTags: ["Tag1", "Tag2"], productName: "Test Product")
        let baseUrl = "https://example.com/"
        
        let foodModel = FoodModel(product: product, baseUrl: baseUrl)
        
        XCTAssertEqual(foodModel.name, "Test Product")
        XCTAssertEqual(foodModel.ingredients, ["Ingredient1", "Ingredient2"])
        XCTAssertEqual(foodModel.ingredientsTags, ["Tag1", "Tag2"])
    }
    
}
