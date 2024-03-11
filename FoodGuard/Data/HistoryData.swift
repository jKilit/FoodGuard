//
//  HistoryData.swift
//  FoodGuard
//
//  Created by Edvin Mujanovic on 2024-03-11.
//

import Foundation
import SwiftData


@Model
final class HistoryData {
    @Attribute(.unique) let id = UUID().uuidString
    let productName: String
    
    init(productName: String) {
        self.productName = productName
    }

}
