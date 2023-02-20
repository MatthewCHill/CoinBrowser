//
//  CoinTableViewController.swift
//  CoinBrowser
//
//  Created by Matthew Hill on 2/20/23.
//

import UIKit

class CoinTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoinController.fetchCoins { success in
            if success == true {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - proerties
    // var coins: [Coin] = []
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CoinController.coins.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath)
        
        let coin = CoinController.coins[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = coin.name
        config.secondaryText = coin.symbol + "" + coin.id
        cell.contentConfiguration = config
        
        
        return cell
    }
    
    
    
} // End of class
