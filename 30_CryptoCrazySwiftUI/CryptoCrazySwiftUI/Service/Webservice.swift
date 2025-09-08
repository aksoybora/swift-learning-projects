//
//  Webservice.swift
//  CryptoCrazySwiftUI
//
//  Created by Bora Aksoy on 21.02.2025.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrency]?,DownloaderError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
}

enum DownloaderError : Error {
    case badUrl
    case noData
    case dataParseError
}
