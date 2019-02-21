//
//  DetailCurrencyIDController.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 24/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import UIKit


class DetailCurrencyIDController: UIViewController {
   
    var coinItem:Coin?
    
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var maxSupply: UILabel!
    @IBOutlet weak var marketCap: UILabel!
    @IBOutlet weak var availableSupply: UILabel!
    @IBOutlet weak var totalSupply: UILabel!
    @IBOutlet weak var changed7d: UILabel!
    @IBOutlet weak var changed1h: UILabel!
    @IBOutlet weak var changed24h: UILabel!
    @IBOutlet weak var statusColorView: UIView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinShortNameLabel: UILabel!
    @IBOutlet weak var rank: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let priceformatter = NumberFormatter()
        priceformatter.numberStyle = NumberFormatter.Style.currency
        if let coin = SelectedCoinClass.sharedInstance.coin {
        let formattedStringPrice = priceformatter.string(for: Float(coin.price_usd))
        
        coinNameLabel.text  = coin.name + " - \(formattedStringPrice!)"
        coinShortNameLabel.text = coin.symbol
        rank.text = coin.rank
        statusColorView.backgroundColor = coin.changed_24h < 0 ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
        changed24h.text = "\(coin.changed_24h)%"
        changed24h.textColor = coin.changed_24h < 0 ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
        
        changed1h.text = coin.changed_1h + "%"
        changed1h.textColor = coin.changed_1h.contains("-") ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
        
            if let coin7d = coin.changed_7d {
        changed7d.text = coin7d + "%"
        changed7d.textColor = coin7d.contains("-") ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
            }
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        
        let mSupply = Float(coin.maxsupply ?? "")
        let tSupply = Float(coin.totalSupply)
        let aSupply = Float(coin.supply)
        let volumeC = Float(coin.volume)
        
        let formattedStringVolume = formatter.string(for: volumeC)
        let formattedStringAvailableSupply = formatter.string(for: aSupply)
        let formattedStringTotalSupply = formatter.string(for: tSupply)
        
        let formattedStringMaxSupply = formatter.string(for: mSupply)
        let formattedStringMarketCap = formatter.string(for: Float(coin.marketcap))
        
        volume.text = "Volume (24h) : $\(formattedStringVolume!)"
        marketCap.text = "Marketcap : $\(formattedStringMarketCap!)"
        availableSupply.text = "Circulating supply : \(formattedStringAvailableSupply!)"
        totalSupply.text = "Total supply : \(formattedStringTotalSupply!)"
        
        maxSupply.text = coin.maxsupply != nil ? "Max supply : \(formattedStringMaxSupply!)" : ""
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
