//
//  PosterImageImageView.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import UIKit

final class PosterImageView: UIImageView {
    private var dataTask: URLSessionTask?
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(urlString: String?) {
        guard let urlString = urlString else {return}
        guard let url = URL(string: urlString) else {
            return
        }
       dataTask = ApiManager.shared.download(url: url) {[weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .failure(_):
                break
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)

                }
            }
        }
        dataTask?.resume()
    }
    
    func cancelDownloading() {
        dataTask?.cancel()
        dataTask = nil
    }
    
}
