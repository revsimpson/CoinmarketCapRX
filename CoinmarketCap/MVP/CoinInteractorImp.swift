//
//  CoinInteractorImp.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 23/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import Foundation
import Alamofire
//import UnboxedAlamofire
import Unbox
import RxSwift
import RxAlamofire


class CoinInteractorImp:CoinInteractor {
    
    func getData(limit:Int = 1000) -> Single<[Coin]>   {
        let manager = SessionManager.default
        
        let url = URL(string:"https://api.coinmarketcap.com/v1/ticker/?convert=EUR&limit=\(limit)")
        return  manager.rx.request(.get, url!.absoluteString).validate().responseData().asSingle().map({ (response,data)
            ->  [Coin]  in
            do {
                let model: [Coin] = try unbox(data: data)
                return model
            } catch {
                throw error
            }
 
        })
            
      
    
        }
        
   
}
