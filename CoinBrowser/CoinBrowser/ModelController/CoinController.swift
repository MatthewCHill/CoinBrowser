//
//  CoinController.swift
//  CoinBrowser
//
//  Created by Matthew Hill on 2/20/23.
//

import Foundation

class CoinController {
    
    // MARK: - Properties
    //var coins: [Coin] = [String : String]
    
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
                    as? [String : Any] {
                    let coin = Coin(array: topLevel)
                    completion(true)
                }
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
        } .resume()
    }
}
