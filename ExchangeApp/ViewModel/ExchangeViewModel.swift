//
//  ExchangeViewModel.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 16.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation
import Alamofire

class ExchangeViewModel: BaseViewModel {

    var exchange: [Exchange] = []
    
    func fillCell(_ indexPath: IndexPath, _ tbView: UITableView, model: [baseModel]?) -> ExchangeCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExchangeCell
        cell.lblCurAmount.text = String(describing: model![indexPath.row].buying ?? 0.0)
        cell.lblCurrenyName.text = model![indexPath.row].full_name ?? ""
        setFlagsFor(indexPath.row, cell, code: model![indexPath.row].code ?? "")
        cell.lblCurAmount.textColor = getChangeRate(indexPath, cell,  rate: model![indexPath.row].change_rate ?? 0.0 )
        return cell
    }
    
    func getObjectCount() -> Int {
        if self.exchange.count > 0 {
             return self.exchange.count
        } else {
            return 1
        }
       
    }
    
   
    private func getChangeRate(_ row: IndexPath,_ cell: ExchangeCell, rate: Float) -> UIColor {
        if rate > 0 {
            return UIColor.red
        } else {
            return UIColorFromRGB(0x46963E)
        }
        
    }

    private func setFlagsFor(_ row: Int, _ cell: ExchangeCell, code: String) {
        switch code {
        case "USD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "unitedstates")
            break
        case "EUR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "europeanunion")
            break
        case "CHF":
            cell.imgCurrency.image = #imageLiteral(resourceName: "swaziland")
            break
        case "GBP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "unitedkingdom")
            break
        case "DKK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "denmark")
            break
        case "SEK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "sweden")
            break
        case "NOK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "norway")
            break
        case "JPY":
            cell.imgCurrency.image = #imageLiteral(resourceName: "japan")
            break
        case "SAR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "saudiarabia")
            break
        case "AUD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "australia")
            break
        case "CAD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "canada")
            break
        case "AED":
            cell.imgCurrency.image = #imageLiteral(resourceName: "unitedarabemirates")
            break
        case "RUB":
            cell.imgCurrency.image = #imageLiteral(resourceName: "russia")
            break
        case "KWD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "kuwait")
            break
        case "ZAR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "southafrica")
            break
        case "BHD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "bahrain")
            break
        case "LYD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "libya")
            break
        case "SAR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "saudiarabia")
            break
        case "IQD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "iraq")
            break
        case "IRR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "iran")
            break
        case "INR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "india")
            break
        case "MXN":
            cell.imgCurrency.image = #imageLiteral(resourceName: "mexico")
            break
        case "HUF":
            cell.imgCurrency.image = #imageLiteral(resourceName: "hungary")
            break
        case "NZD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "newzealand")
            break
        case "BRL":
            cell.imgCurrency.image = #imageLiteral(resourceName: "brazil")
            break
        case "CSK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "czechrepublic")
            break
        case "PLN":
            cell.imgCurrency.image = #imageLiteral(resourceName: "poland")
            break
        case "BGN":
            cell.imgCurrency.image = #imageLiteral(resourceName: "bulgaria")
            break
        case "RON":
            cell.imgCurrency.image = #imageLiteral(resourceName: "romania")
            break
        case "CNY":
            cell.imgCurrency.image = #imageLiteral(resourceName: "china")
            break
        case "ARS":
            cell.imgCurrency.image = #imageLiteral(resourceName: "argentina")
            break
        case "ALL":
            cell.imgCurrency.image = #imageLiteral(resourceName: "albania")
            break
        case "AZN":
            cell.imgCurrency.image = #imageLiteral(resourceName: "azerbaijan")
            break
        case "BAM":
            cell.imgCurrency.image = #imageLiteral(resourceName: "bosniaandherzegovina")
            break
        case "BYR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "belarus")
            break
        case "CLP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "chile")
            break
        case "COP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "colombia")
            break
        case "CRC":
            cell.imgCurrency.image = #imageLiteral(resourceName: "costarica")
            break
        case "DZD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "algeria")
            break
        case "EGP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "egypt")
            break
        case "HKD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "hongkong")
            break
        case "HRK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "croatia")
            break
        case "ISK":
            cell.imgCurrency.image = #imageLiteral(resourceName: "iceland")
            break
        case "JOD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "jordan")
            break
        case "KRW":
            cell.imgCurrency.image = #imageLiteral(resourceName: "korea_south")
            break
        case "KZT":
            cell.imgCurrency.image = #imageLiteral(resourceName: "kazakhstan")
            break
        case "LBP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "lebanon")
            break
        case "LKR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "srilanka")
            break
        case "LTL":
            cell.imgCurrency.image = #imageLiteral(resourceName: "lithuania")
            break
        case "LVL":
            cell.imgCurrency.image = #imageLiteral(resourceName: "latvia")
            break
        case "MAD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "morocco")
            break
        case "MDL":
            cell.imgCurrency.image = #imageLiteral(resourceName: "moldova")
            break
        case "MKD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "macedonia")
            break
        case "OMR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "oman")
            break
        case "PEN":
            cell.imgCurrency.image = #imageLiteral(resourceName: "peru")
            break
        case "PHP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "philippines")
            break
        case "PKR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "pakistan")
            break
        case "QAR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "qatar")
            break
        case "RSD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "serbia")
            break
        case "SGD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "singapore")
            break
        case "SYP":
            cell.imgCurrency.image = #imageLiteral(resourceName: "syria")
            break
        case "THB":
            cell.imgCurrency.image = #imageLiteral(resourceName: "thailand")
            break
        case "TWD":
            cell.imgCurrency.image = #imageLiteral(resourceName: "taiwan")
            break
        case "UAH":
            cell.imgCurrency.image = #imageLiteral(resourceName: "ukraine")
            break
        case "UYU":
            cell.imgCurrency.image = #imageLiteral(resourceName: "uruguay")
            break
        case "IDR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "indonesia")
            break
        case "MYR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "malaysia")
            break
        case "YTR":
            cell.imgCurrency.image = #imageLiteral(resourceName: "turkey")
            break
        default:
            cell.imgCurrency.image = nil
            break
        }
    }
    

}
