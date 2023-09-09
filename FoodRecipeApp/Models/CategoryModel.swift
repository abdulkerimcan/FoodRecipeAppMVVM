//
//  CategoryModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import Foundation

struct Category: Codable {
    let meals: [Meal]?
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
    
    var _strMeal: String {
        strMeal ?? "N/A"
    }
    
    var _strMealThumb: String {
        strMealThumb ?? "N/A"
    }
}
