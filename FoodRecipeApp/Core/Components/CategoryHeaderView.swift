//
//  CategoryHeaderView.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 8.09.2023.
//

import UIKit

final class CategoryHeaderView: UIStackView {
    
    var headerLabel: UILabel!
    var scrollView: UIScrollView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureScrollView()
        configureLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setView(name: String) {
        headerLabel.text = name
    }
    func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        addSubview(scrollView)
    
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10)
        ])
        
    }

    func configureView() {
        backgroundColor = .systemGreen
        layer.cornerRadius = 20
    }
    func configureLabel() {
        headerLabel = UILabel(frame: .zero)
        scrollView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.textColor = .white
        headerLabel.font = .boldSystemFont(ofSize: 13)
        headerLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            headerLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
    }
}

