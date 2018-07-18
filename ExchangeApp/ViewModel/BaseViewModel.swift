//
//  BaseViewModel.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 17.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit
import Alamofire

protocol BaseViewModel {
    func fillCell(_ indexPath: IndexPath, _ tbView: UITableView, model: [baseModel]?) -> ExchangeCell
}

class BaseModel {
    
    var viewModel: BaseViewModel!
    var url: URL?
    var objCount: Int = 0
    var models: [baseModel]?
    
    init() {
        switch selection {
        case .exchange:
            viewModel = ExchangeViewModel()
            break
        case .gold:
            viewModel = GoldViewModel()
            break
        case .stockMarket:
            viewModel = StockMarketViewModel()
            break
        case .crypto:
            viewModel = CryptoCoinViewModel()
            break
        default:
            break
        }
    }

    private func setUrl() -> URL {
        switch selection {
        case .exchange:
            self.url = exchangeUrl
            break
        case .gold:
            self.url = goldUrl
            break
        case .stockMarket:
            self.url = stockMarketUrl
            break
        case  .crypto:
            self.url = cryptoUrl
            break
        default:
            self.url = exchangeUrl
            break
        }
        
        return self.url!
    }
    
    
    func get(_ complete: @escaping (Bool) -> ()) {
        baseRequest(params: nil, requestURL: self.setUrl(), method: .get, encoding: JSONEncoding.default) { (data) in
            if let data = data {
                let obj = try! JSONDecoder().decode([baseModel].self, from: data)
                self.objCount = obj.count
                self.models = obj
                self.setModels()
                complete(true)
            }
        }
    }
    
 
    func getObjectCount() -> Int {
        return self.objCount
    }
    
    func setModels() {
        if let models = self.models {
            if viewModel is ExchangeViewModel {
                let model = viewModel as! ExchangeViewModel
                model.exchange = models as! [Exchange]
            } else if viewModel is GoldViewModel {
                let model = viewModel as! GoldViewModel
                model.golds = models as! [Gold]
            } else if viewModel is StockMarketViewModel {
                let model = viewModel as! StockMarketViewModel
                model.stocks = models as! [Stock]
            } else if viewModel is CryptoCoinViewModel {
                let model = viewModel as! CryptoCoinViewModel
                model.coins = models as! [Cryptocoin]
            }
         }
    }
    
}
