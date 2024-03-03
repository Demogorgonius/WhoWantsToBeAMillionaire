//
//  NetworkService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Sergey on 03.03.2024.
//

import Foundation
//https://opentdb.com/api.php?amount=15&category=9&difficulty=medium&type=multiple

protocol NetworkServiceProtocol: AnyObject {
    
    func getData(completionBlock: @escaping (Result<QuestionModel, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getData(completionBlock: @escaping (Result<QuestionModel, Error>) -> Void) {
        
        let url = URL(string: "https://opentdb.com/api.php?amount=15&category=9&difficulty=medium&type=multiple")
        
        guard let url else {return}
        loadDataFromUrl(url) { result in
            switch result {
            case .success(let data):
                do {
                    let questionData = try JSONDecoder().decode(QuestionModel.self, from: data)
                    completionBlock(.success(questionData))
                } catch let error as NSError {
                    completionBlock(.failure(error))
                }
            case .failure(let error):
                completionBlock(.failure(error))
            }
        }
        
    }
    
    private func loadDataFromUrl(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.wrongCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.notFoundData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
}
