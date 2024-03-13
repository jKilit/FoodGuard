//
//  ProductModelTests.swift
//  FoodGuardTests
//
//  Created by Jonathan Kilit on 2024-03-13.
//

import XCTest
@testable import FoodGuard

class ProductModelTests: XCTestCase {

    var productModel: ProductModel!

    override func setUp() {
        super.setUp()
        productModel = ProductModel()
    }

    override func tearDown() {
        productModel = nil
        super.tearDown()
    }

    func testIsProductVegan() {
        XCTAssertTrue(productModel.isProductVegan(ingredientTags: ["en:vegan"]))
        XCTAssertFalse(productModel.isProductVegan(ingredientTags: ["en:non-vegan"]))
    }

    func testIsPalmOilFree() {
        XCTAssertTrue(productModel.isPalmOilFree(ingredientTags: ["en:ingredient1"]))
        XCTAssertFalse(productModel.isPalmOilFree(ingredientTags: ["en:palm-oil"]))
    }

    func testIsEAdditiveFree() {
        XCTAssertTrue(productModel.isEAdditiveFree(otherIngredients: ["en:ingredient1"]))
        XCTAssertFalse(productModel.isEAdditiveFree(otherIngredients: ["en:e123"]))
    }

    func testCompareIngredients() {
        let result = productModel.compareIngredients(["en:ingredient1"], ingredientTags: ["en:vegan"], productName: "TestProduct")
        XCTAssertTrue(result)
        XCTAssertEqual(productModel.matchedProducts.count, 0)
    }
    
    func testInitialMatchedProductsListIsEmpty() {
        let productModel = ProductModel()
        XCTAssertTrue(productModel.matchedProducts.isEmpty)
    }
    
    func testAddProductToMatchedProducts() {
        let productModel = ProductModel()
        let productName = "TestProduct"
        let alertTriggeringIngredients: Set<Ingredient> = [.animalProducts, .palmOil]
        productModel.matchedProducts.append((productName: productName, alertTriggeringIngredients: alertTriggeringIngredients))
        XCTAssertEqual(productModel.matchedProducts.count, 1)
        XCTAssertEqual(productModel.matchedProducts.first?.productName, productName)
        XCTAssertEqual(productModel.matchedProducts.first?.alertTriggeringIngredients, alertTriggeringIngredients)
    }

}
