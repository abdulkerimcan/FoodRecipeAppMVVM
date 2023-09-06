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
}

final class HomeViewModel {
    weak var view: HomeScreenDelegate?
}

extension HomeViewModel: HomeViewModelDelegate {
    func viewDidLoad() {
        view?.configureVC()
    }
}
