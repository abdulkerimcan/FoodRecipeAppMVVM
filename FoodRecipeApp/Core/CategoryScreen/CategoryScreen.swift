//
//  CategoryScreen.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import UIKit

protocol CategoryScreenDelegate: AnyObject {
    func configureVC()
    func configureHeader()
    func configureCollectionView()
    func reloadCollectionView()
}

final class CategoryScreen: UIViewController {
    private let categoryName: String
    private let categoryDescription: String
    private let viewModel: CategoryViewModel
    var headerView: CategoryHeaderView!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    init(categoryName: String,categoryDescription: String) {
        
        self.categoryDescription = categoryDescription
        self.categoryName = categoryName
        viewModel = CategoryViewModel(categoryName: categoryName)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryScreen: CategoryScreenDelegate {
    
    func configureHeader() {
        headerView = CategoryHeaderView()
        
        view.addSubview(headerView)
        
        headerView.setView(name: categoryDescription)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth),
            headerView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight/3),
        ])
    }
    
    func configureVC() {
        title = categoryName
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .systemGreen
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createVerticalLayout())
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MealsCollectionViewCell.self, forCellWithReuseIdentifier: MealsCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension CategoryScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.mealsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealsCollectionViewCell.identifier, for: indexPath) as! MealsCollectionViewCell
        cell.setCell(meal: viewModel.mealsList[indexPath.item])
        return cell
    }
}
