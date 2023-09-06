//
//  RecipeCollectionViewCell.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    static let identifer = "RecipeCollectionViewCell"
    private var categoryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        
    }
    
    func setCell(recipeResult: RecipeResult) {
        
    }
    
    func configureCell() {
        self.backgroundColor = .systemGray3
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    func configureCategoryLabel() {
        categoryLabel = UILabel(frame: .zero)
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = .boldSystemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
}
