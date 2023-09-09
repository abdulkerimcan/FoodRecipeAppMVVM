//
//  CategoryModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 7.09.2023.
//

import Foundation


struct Categories: Codable {
    let categories: [CategoryElement]?
}

// MARK: - CategoryElement
struct CategoryElement: Codable {
    let idCategory, strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
    
    var _strCategory: String {
        strCategory ?? "N/A"
    }
    var _strCategoryThumb: String {
        strCategoryThumb ?? "N/A"
    }
    var _strCategoryDescription: String {
        strCategoryDescription ?? "N/A"
    }
}
