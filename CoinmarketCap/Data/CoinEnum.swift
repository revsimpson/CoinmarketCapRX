//
//  CoinEnum.swift
//  CoinmarketCap
//
//  Created by Richard EV Simpson on 27/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import Foundation
import UIKit

enum filterEnum:Int {
    case biggestGains
    case biggestLoss
    case winners
    case losers
    case nofilter
}

enum cellType : String  {
    case normal = "CoinCell"
    case small = "CoinCellSmall"
}

enum cellSize : CGFloat  {
    case normal = 128
    case small =  58
}
