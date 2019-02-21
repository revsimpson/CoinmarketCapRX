//
//  CoinCellSmall.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 25/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import UIKit

class CoinCellSmall: CoinBaseCell {
    
    
    @IBOutlet var img: UIImageView!
    @IBOutlet weak var changed24h: UILabel!
    @IBOutlet weak var statusColorView: UIView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var rank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func setData(coin:Coin) {
        img.image = UIImage(named:"\(coin.symbol.lowercased())")
        let priceformatter = NumberFormatter()
        priceformatter.numberStyle = NumberFormatter.Style.currency
        
        let formattedStringPrice = priceformatter.string(for: Float(coin.price_usd))
        
        coinNameLabel.text  = coin.name + " - \(formattedStringPrice!)"
        rank.text = coin.rank
        statusColorView.backgroundColor = coin.changed_24h < 0  ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
        changed24h.text = "\(coin.changed_24h)%"
        changed24h.textColor = coin.changed_24h < 0  ? UIColor(red: 1, green: 38/255, blue: 0, alpha: 1) : UIColor(red: 38/255, green: 175/255, blue: 1/255, alpha: 1)
    }
}

