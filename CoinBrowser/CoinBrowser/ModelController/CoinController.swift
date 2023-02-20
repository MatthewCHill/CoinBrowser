//
//  CoinController.swift
//  CoinBrowser
//
//  Created by Matthew Hill on 2/20/23.
//

import Foundation

class CoinController {
    
    // MARK: - Properties
    static var coins: [Coin] = []
    
    // MARK: - Functions
    
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        guard let baseURL = URL(string: Constants.CryptoCoins.baseURL) else { return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(Constants.CryptoCoins.coinPath)
        
        guard let finalURL = urlComponents?.url else { return }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
             
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            }
            if let response = response as? HTTPURLResponse {
                print("Response Status Code:\(response.statusCode)")
            }
            guard let data = data else {return}
            do {
                if let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    as? [[String : Any]] {
                    for coinDictionary in topLevel {
                        guard  let coin = Coin(dictionaries: coinDictionary) else {return}
                        coins.append(coin)
                        
                    }
                }
                completion(true)
                
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
        } .resume()
    }
}


