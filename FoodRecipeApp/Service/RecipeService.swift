//
//  RecipeService.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import Foundation

final class RecipeService {
    
    func downloadRecipe(completion: @escaping ([RecipeResult]?) -> ()) {
       
        
        ApiManager.shared.download(url: "https://tasty.p.rapidapi.com/feeds/list?size=5&timezone=%2B0700&vegetarian=false&from=0") { result in
            switch result {
            case .failure(let error):
                self.handleWithError(error: error)
            case .success(let data):
                completion(self.handleWithData(data: data))
            }
        }
    }
    
    func handleWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func handleWithData(data: Data) -> [RecipeResult]?{
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            
            return recipe.results
        }catch{
            handleWithError(error: error)
        }
        return nil
    }
}
