//
//  RecipeCollectionViewCell.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
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
        super.prepareForReuse()
        posterImage.image = nil
        posterImage.cancelDownloading()
    }
    
    func setCell(categoryResult: CategoryElement) {
        posterImage.downloadImage(urlString: categoryResult._strCategoryThumb)
        categoryLabel.text = categoryResult.strCategory
    }
    
    func configureCell() {
        layer.borderWidth = 0.3
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    func configureCategoryLabel() {
        categoryLabel = UILabel(frame: .zero)
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.numberOfLines = 0
        categoryLabel.font = .boldSystemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryLabel.bottomAnchor.constraint(lessThanOrEqualTo: posterImage.bottomAnchor,constant: 40)
        ])
    }
    func configurePosterImageView() {
        posterImage = PosterImageView(frame: .zero)
        addSubview(posterImage)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImage.widthAnchor.constraint(equalToConstant: CGFloat.dWidth * 0.3),
            posterImage.heightAnchor.constraint(equalToConstant: CGFloat.dWidth * 0.3),
            posterImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
