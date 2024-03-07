//
//  FoodGuardTests.swift
//  FoodGuardTests
//
//  Created by Edin Nasic on 2024-02-10.
//

import XCTest
@testable import FoodGuard

final class FoodGuardTests: XCTestCase { //mall

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//----------------- Some tests: ---------------

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


class FoodModelTests: XCTestCase {
    func testFoodModelInitialization() {
        // Given
        let product = FoodData.Product(ingredientsHierarchy: ["Ingredient1", "Ingredient2"], ingredientsAnalysisTags: ["Tag1", "Tag2"], productName: "Test Product")
        let baseUrl = "https://example.com/"
        
        // When
        let foodModel = FoodModel(product: product, baseUrl: baseUrl)
        
        // Then
        XCTAssertEqual(foodModel.name, "Test Product")
        XCTAssertEqual(foodModel.ingredients, ["Ingredient1", "Ingredient2"])
        XCTAssertEqual(foodModel.ingredientsTags, ["Tag1", "Tag2"])
    }
    
}

class ScannedProductTests: XCTestCase {

    // Test case for ScannedProduct initialization
    func testScannedProductInitialization() {
        let scannedProduct = ScannedProduct(productName: "TestProduct")
        XCTAssertEqual(scannedProduct.productName, "TestProduct")
    }

}


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

//------------------------------------------
