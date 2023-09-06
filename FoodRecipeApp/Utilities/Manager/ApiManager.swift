//
//  ApiManager.swift
//  FoodRecipeApp
//
//  Created by Abdulkerim Can on 6.09.2023.
//

import Foundation

class ApiManager{
    static var shared = ApiManager()
    private init() {}
    
    func download(url: String, completion: @escaping (Result<Data,Error>) -> ()) {
        
        let headers = [
            "X-RapidAPI-Key": "<API-KEY",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
