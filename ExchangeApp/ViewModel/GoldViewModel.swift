//
//  GoldViewModel.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 17.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation
import Alamofire

class GoldViewModel: BaseViewModel {
    var golds: [Gold] = []
    
    func fillCell(_ indexPath: IndexPath, _ tbView: UITableView, model: [baseModel]?) -> ExchangeCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExchangeCell
        cell.lblCurAmount.text = String(describing: model![indexPath.row].buying ?? 0.0)
        cell.lblCurrenyName.text = model![indexPath.row].full_name ?? ""
        cell.imgCurrency.image = #imageLiteral(resourceName: "gold")
//        setFlagsFor(indexPath.row, cell, code: model![indexPath.row].code ?? "")
//        cell.lblCurAmount.textColor = getChangeRate(indexPath, cell,  rate: model![indexPath.row].change_rate ?? 0.0 )
        return cell
    }
}
