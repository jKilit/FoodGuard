//
//  FoodAPITests.swift
//  FoodGuardTests
//
//  Created by Jonathan Kilit on 2024-03-13.
//

import XCTest
@testable import FoodGuard

class FoodAPITests: XCTestCase {
    func testLoadFoodSuccess() async {
        // Given
        let api = FoodAPI()
        let barcode = "3017620422003" // nutella barcode for testing
        
        // When
        do {
            try await api.loadFood(barcode: barcode)
            
            // Then
            XCTAssertNotNil(api.foodModel)
            // Add more assertions
        } catch {
            XCTFail("Failed with error: \(error)")
        }
    }
    
    // can add more test scenarios (e.g., network error, invalid barcode, etc.)
}
