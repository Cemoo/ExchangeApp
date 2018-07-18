//
//  StockViewModel.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 18.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class StockMarketViewModel: BaseViewModel {
    var stocks: [Stock] = []
    
    func fillCell(_ indexPath: IndexPath, _ tbView: UITableView, model: [baseModel]?) -> ExchangeCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExchangeCell
        cell.lblCurAmount.text = String(describing: model![indexPath.row].latest ?? 0.0)
        cell.lblCurrenyName.text = model![indexPath.row].full_name ?? ""
        cell.imgCurrency.image = #imageLiteral(resourceName: "banking")
        return cell
    }
}
