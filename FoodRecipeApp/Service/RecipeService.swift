//
//  RecipeService.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import Foundation

final class RecipeService {
    
    func downloadCategories(completion: @escaping ([CategoryElement]?) -> ()) {
       
        guard let url = URL(string:"https://www.themealdb.com/api/json/v1/1/categories.php") else {return}
        ApiManager.shared.download(url: url) { result in
            switch result {
            case .failure(let error):
                self.handleWithError(error: error)
            case .success(let data):
                completion(self.handleWithData(data: data))
            }
        }
    }
    
    func downloadCategory(strCategory: String,completion: @escaping (Category?) -> ()) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(strCategory)") else {return}
        ApiManager.shared.download(url: url) { result in
            switch result {
            case .failure(let error):
                self.handleWithError(error: error)
            case .success(let data):
                completion(self.handleWithData(data: data))
            }
        }
    }
    
    
    private func handleWithError(error: Error) {
        print(String(describing: error.localizedDescription))
    }
    
    private func handleWithData(data: Data) -> [CategoryElement]?{
        do {
            let category = try JSONDecoder().decode(Categories.self, from: data)
            return category.categories
        }catch{
            handleWithError(error: error)
        }
        return nil
    }
    
    private func handleWithData(data: Data) -> Category?{
        do {
            let category = try JSONDecoder().decode(Category.self, from: data)
            return category
        }catch{
            handleWithError(error: error)
        }
        return nil
    }
}
