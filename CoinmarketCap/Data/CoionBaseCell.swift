//
//  CoionCell.swift
//  CoinmarketCap
//
//  Created by Richard EV Simpson on 27/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import Foundation
import UIKit

class CoinBaseCell: UITableViewCell , CoinCellProtocol {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(coin: Coin) {
        // override
    }
}
