//
//  CoinClass.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 22/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import Foundation
import Unbox

struct Coin {
    let id:String
    let name:String
    let symbol:String
    let rank:String
    let price_usd:String
    let price_btc:String
    let volume:String
    let marketcap:String
    let supply:String
    let totalSupply:String
    let changed_1h:String
    let changed_24h:Double
    let changed_7d:String?
    let lastUpdate:String
    let maxsupply:String?
    let price_eur:String
    let volume_eur:String
    let marketcap_eur:String
}

extension Coin: Unboxable {
    init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.name = try unboxer.unbox(key: "name")
        self.symbol = try unboxer.unbox(key: "symbol")
        self.rank = try unboxer.unbox(key: "rank")
        self.price_usd = try unboxer.unbox(key: "price_usd")
        self.price_btc = try unboxer.unbox(key: "price_btc")
        self.volume = try unboxer.unbox(key: "24h_volume_usd")
        self.marketcap = try unboxer.unbox(key: "market_cap_usd")
        self.supply = try unboxer.unbox(key: "available_supply")
        self.totalSupply = try unboxer.unbox(key: "total_supply")
        self.changed_1h = try unboxer.unbox(key: "percent_change_1h")
        self.changed_24h =  unboxer.unbox(key: "percent_change_24h") ?? 0
        self.changed_7d = unboxer.unbox(key: "percent_change_7d")
        self.lastUpdate = try unboxer.unbox(key: "last_updated")
        self.maxsupply = unboxer.unbox(key: "max_supply")
        self.price_eur = try unboxer.unbox(key: "price_eur")
        self.volume_eur = try unboxer.unbox(key: "24h_volume_eur")
        self.marketcap_eur = try unboxer.unbox(key: "market_cap_eur")
    }
}


