//
//  MVPCoin.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 23/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol CoinInteractor {
          func getData(limit:Int) -> Single<[Coin]>
}

protocol CoinPresenter {
    func viewDidLoad()
    func getCoinData()->[Coin]
    func addFilter(filter:filterEnum)
    func removeFilters()
    func removeFilet(filter:filterEnum)
    func RefreshData()
}

protocol CoinView {
    func setSpinner(on:Bool)
    func dataLoaded()
}

protocol CoinCellProtocol {
    func setData(coin:Coin)
}
