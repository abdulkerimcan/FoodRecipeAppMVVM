//
//  MealsCollectionViewCell.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 9.09.2023.
//

import UIKit

final class MealsCollectionViewCell: UICollectionViewCell {
    static let identifier = "MealsCollectionViewCell"
    private var posterImage: PosterImageView!
    private var mealNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImage()
        configureMealNameLabel()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.image = nil
        posterImage.cancelDownloading()
    }
    
    func configureCell() {
        layer.borderWidth = 0.3
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    func configurePosterImage() {
        posterImage = PosterImageView(frame: .zero)
        addSubview(posterImage)
        
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            posterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            posterImage.topAnchor.constraint(equalTo: self.topAnchor)

        ])
    }
    
    func configureMealNameLabel() {
        mealNameLabel = UILabel(frame: .zero)
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: CGFloat.padding),
            mealNameLabel.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor,constant: CGFloat.padding),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mealNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
    
    func setCell(meal: Meal) {
        posterImage.downloadImage(urlString: meal._strMealThumb)
        mealNameLabel.text = meal._strMeal
    }
}
