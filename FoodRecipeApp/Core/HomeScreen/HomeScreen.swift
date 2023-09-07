//
//  HomeScreen.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func configureVC()
    func configureCollectionView()
    func configureHeaderLabel()
    func reloadCollectionView()
    func navigateToCategory(category: Category)
}

final class HomeScreen: UIViewController {
    
    let viewModel = HomeViewModel()
    var headerLabel: UILabel!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenDelegate {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Categories"
        
    }
    
    func configureHeaderLabel() {
        headerLabel = UILabel(frame: .zero)
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Find best recipes for cooking"
        headerLabel.font = .boldSystemFont(ofSize: 30)
        headerLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: CGFloat.padding),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

        ])
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createLayout())
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifer)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor,constant: CGFloat.padding),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ])
    }
    

    
    func reloadCollectionView() {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    func navigateToCategory(category: Category) {
        DispatchQueue.main.async {
            let categoryScreen = CategoryScreen(category: category)
            self.navigationController?.pushViewController(categoryScreen, animated: true)
        }
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifer, for: indexPath) as! RecipeCollectionViewCell
        cell.setCell(categoryResult: viewModel.categoryList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getCategory(strCategory: viewModel.categoryList[indexPath.item]._strCategory)
    }
    
}
