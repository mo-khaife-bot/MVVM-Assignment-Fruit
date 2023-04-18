//
//  FruitStats.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import Foundation

struct FruitStats: Decodable {
    let name: String
    let id: Int
    let family, order, genus: String
    let nutritions: Nutritions
    
}

// MARK: - Nutritions
struct Nutritions: Decodable {
    let calories: Int
    let fat, sugar, carbohydrates, protein: Double
}
