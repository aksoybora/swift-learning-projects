//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Bora Aksoy on 21.02.2025.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webService = Webservice()
    
    func downloadCryptos(url: URL) {
        
        webService.downloadCurrencies(url: url) { result in
            
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
}


struct CryptoViewModel {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
}
