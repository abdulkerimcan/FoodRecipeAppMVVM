//
//  CategoryScreen.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import UIKit

protocol CategoryScreenDelegate: AnyObject {
    func configureVC()
}

final class CategoryScreen: UIViewController {
    private let category: Category
    private let viewModel = CategoryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    init(category: Category) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryScreen: CategoryScreenDelegate {
    func configureVC() {
        title = category.meals?.first?.strMeal
        view.backgroundColor = .white
    }
    
    
}
