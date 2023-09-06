//
//  HomeScreen.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func configureVC()
}

final class HomeScreen: UIViewController {
    
    let service = RecipeService()
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenDelegate {
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Food Recipe"
    }
}
