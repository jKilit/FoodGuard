//
//  PreferencesModelTests.swift
//  FoodGuardTests
//
//  Created by Jonathan Kilit on 2024-03-13.
//

import XCTest
@testable import FoodGuard
class PreferencesModelTests: XCTestCase {

    var preferencesModel: PreferencesModel!

    override func setUp() {
        super.setUp()
        preferencesModel = PreferencesModel()
    }

    override func tearDown() {
        preferencesModel = nil
        super.tearDown()
    }
    
    //make sure to have all preferences off before testing this
    func testToggleIngredient() {
        XCTAssertEqual(preferencesModel.selectedIngredients.count, 0)
        preferencesModel.toggleIngredient(.palmOil)
        XCTAssertEqual(preferencesModel.selectedIngredients.count, 1)
        preferencesModel.toggleIngredient(.palmOil)
        XCTAssertEqual(preferencesModel.selectedIngredients.count, 0)
    }

}
