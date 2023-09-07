//
//  CategoryViewModel.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import Foundation

protocol CategoryViewModelDelegate {
    func viewDidLoad()
    var view: CategoryScreenDelegate? { get set }
}

final class CategoryViewModel {
    weak var view: CategoryScreenDelegate?
}

extension CategoryViewModel: CategoryViewModelDelegate {
    func viewDidLoad() {
        view?.configureVC()
    }
    
}
