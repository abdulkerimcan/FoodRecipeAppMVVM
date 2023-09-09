//
//  HomeViewModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import Foundation

protocol HomeViewModelDelegate {
    var view: HomeScreenDelegate? {get set}
    func viewDidLoad()
    func getCategories()
    func getCategory(strCategory: String,categoryElement: CategoryElement)
}

final class HomeViewModel {
    weak var view: HomeScreenDelegate?
    private let service = RecipeService()
    var categoryList: [CategoryElement] = []
}

extension HomeViewModel: HomeViewModelDelegate {
    
    func getCategory(strCategory: String, categoryElement: CategoryElement) {
        
            self.view?.navigateToCategory(categoryElement: categoryElement)
        
    }
    
    func getCategories() {
        service.downloadCategories { [weak self] categories in
            guard let self = self else {
                return
            }
            guard let categories = categories else {return}
            
            self.categoryList.append(contentsOf: categories)
            self.view?.reloadCollectionView()
        }
    }
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureHeaderLabel()
        view?.configureCollectionView()
        getCategories()
    }
    
}
