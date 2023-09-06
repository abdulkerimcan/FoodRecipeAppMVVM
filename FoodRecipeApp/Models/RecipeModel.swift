//
//  RecipeModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.

import Foundation

struct Recipe: Codable {
    let results: [RecipeResult]?
}

struct RecipeResult: Codable {
    let type: String?
    let name, category: String?
    let minItems: Int?
    let items: [PurpleItem]?

    enum CodingKeys: String, CodingKey {
        case type,name, category
        case minItems = "min_items"
        case items
    }
}


struct PurpleItem: Codable {
    let country: String?
    let userRatings: String?
    let id: Int?
    let name: String?
    let description: String?
    let thumbnailURL: String?
    let totalTimeMinutes: Int?
    let videoURL: String?


    enum CodingKeys: String, CodingKey {

        case country
        case userRatings = "user_ratings"
        case id
        case name
        case description
        case thumbnailURL = "thumbnail_url"
        case totalTimeMinutes = "total_time_minutes"
        case videoURL = "video_url"
    }
}
