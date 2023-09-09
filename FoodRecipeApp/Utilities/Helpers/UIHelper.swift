//
//  UIHelper.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

enum UIHelper {
    static func createGridLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let size = CGSize(width: (CGFloat.dWidth-20)/2, height: (CGFloat.dWidth-10)/2)
        layout.itemSize = size
        return layout
    }
    static func createVerticalLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let itemWidth = CGFloat.dWidth
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: CGFloat.padding, bottom: 0, right: CGFloat.padding)
        layout.itemSize = CGSize(width: itemWidth - CGFloat.padding * 2, height: itemWidth/2)
        layout.minimumLineSpacing = 10
        return layout
    }
}
