//
//  FoodModel.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-02-13.
//

import Foundation
import Observation


@Observable
class FoodModel {
    let name : String
    
    init(product: FoodData.Product, baseUrl: String) {
        name = product.productName
    }
}
