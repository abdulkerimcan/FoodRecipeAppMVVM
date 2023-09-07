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
    func getCategory(strCategory: String)
}

final class HomeViewModel {
    weak var view: HomeScreenDelegate?
    private let service = RecipeService()
    var categoryList: [CategoryElement] = []
}

extension HomeViewModel: HomeViewModelDelegate {
    func getCategory(strCategory: String) {
        service.downloadCategory(strCategory: strCategory) { [weak self] category in
            guard let self = self else {return}
            guard let category = category else {return}
            self.view?.navigateToCategory(category: category)
        }
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
