//
//  Coin.swift
//  CoinBrowser
//
//  Created by Matthew Hill on 2/20/23.
//

import Foundation

class Coin {
    
    let id: String
    let symbol: String
    let name: String
    
    enum Keys: String {
        case id
        case symbol
        case name
    }
    
    init?(dictionaries: [String : Any]){
        guard let id = dictionaries[Keys.id.rawValue] as? String,
              let symbol = dictionaries[Keys.symbol.rawValue] as? String,
              let name = dictionaries[Keys.name.rawValue] as? String  else {return nil}
        
        self.id = id
        self.symbol = symbol
        self.name = name
    }
} // End of class
