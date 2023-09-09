//
//  CategoryViewModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import Foundation

protocol CategoryViewModelDelegate {
    func viewDidLoad()
    func getMeals(strCategory: String)
    var view: CategoryScreenDelegate? { get set }
}

final class CategoryViewModel {
    weak var view: CategoryScreenDelegate?
    private var service = RecipeService()
    var mealsList: [Meal] = []
    private let categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
    
    
}

extension CategoryViewModel: CategoryViewModelDelegate {
    func getMeals(strCategory: String) {
        service.downloadCategory(strCategory: strCategory) { [weak self] category in
            guard let self = self else {return}
            guard let category else {return}
            guard let meals = category.meals else {return}
            self.mealsList.append(contentsOf: meals)
            self.view?.reloadCollectionView()
        }
    }
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureHeader()
        view?.configureCollectionView()
        getMeals(strCategory: categoryName)
        
    }
}
