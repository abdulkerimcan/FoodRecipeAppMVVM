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
    private var posterImage: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImageView()
        configureCategoryLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        posterImage.image = nil
        posterImage.cancelDownloading()
    }
    
    func setCell(categoryResult: CategoryElement) {
        posterImage.downloadImage(item: categoryResult)
        categoryLabel.text = categoryResult.strCategory
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
    func configurePosterImageView() {
        posterImage = PosterImageView(frame: .zero)
        addSubview(posterImage)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: self.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            posterImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
