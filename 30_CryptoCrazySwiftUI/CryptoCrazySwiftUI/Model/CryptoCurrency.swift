//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Bora Aksoy on 21.02.2025.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    //API'dan geleceklerin hangi isimle geleceğini belirtmek için
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
