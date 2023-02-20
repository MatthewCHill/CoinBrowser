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
    
    init?(array: [String : Any]){
        guard let id = array[Keys.id.rawValue] as? String,
              let symbol = array[Keys.symbol.rawValue] as? String,
              let name = array[Keys.name.rawValue] as? String else {return nil}
        
        self.id = id
        self.symbol = symbol
        self.name = name
    }
} // End of class
