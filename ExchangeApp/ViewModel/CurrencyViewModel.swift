//
//  CurrencyViewModel.swift
//  ExchangeApp
//
//  Created by Cemal BAYRI on 6/23/19.
//  Copyright © 2019 Cemal BAYRI. All rights reserved.
//

import Foundation
import Alamofire

enum CurrencyType {
    case doviz, altin, crypto
}

protocol FlagSetterProtocol: class {
    func setFlagsFor(_ row: Int, _ cell: ExchangeCell, code: String)
}

protocol CurrencyViewModelProtocol: FlagSetterProtocol {
    var currencytype: CurrencyType! {get set}
    var delegate: ServiceOutputDelegate? {get set}
    var currencies: [Currency]! {get set}
    func load()
}




enum ServiceOutput {
    case showLoading(Bool)
    case showData([Currency])
    case showError(String)
}

extension ServiceOutput: Equatable {
    static func == (lhs: ServiceOutput, rhs: ServiceOutput) -> Bool {
        return true
    }
}


protocol ServiceOutputDelegate: class {
    func handleViewModelOutput(_ output: ServiceOutput)
}

class CurrencyViewModel: CurrencyViewModelProtocol {
    var delegate: ServiceOutputDelegate?
    var currencytype: CurrencyType!
    var currencies: [Currency]!
    
    private var apiUrl: URL!
    
    init(type: CurrencyType) {
        self.currencytype = type
        
        switch currencytype {
        case .doviz?:
            apiUrl = URL(string: dovizUrlStr)!
            break
        case .altin?:
            apiUrl = URL(string: altinUrlStr)!
            break
        case .crypto?:
            apiUrl = URL(string: kriptoUrlStr)!
            break
        default:
            apiUrl = URL(string: dovizUrlStr)!
            break
        }
    }
    
    func load() {
        notify(.showLoading(true))
        baseRequest(requestURL: self.apiUrl, method: .get, encoding: JSONEncoding.default) { (data) in
            self.notify(.showLoading(false))
            if let data = data {
                do {
                    let data = try JSONDecoder().decode([Currency].self, from: data)
                    self.currencies = data
                    self.notify(.showData(self.currencies))
                } catch {
                    self.notify(.showError("Error"))
                }
            } else {
                self.notify(.showError("Error"))
            }
        }
    }
    
    fileprivate func notify(_ output: ServiceOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
    
    func setFlagsFor(_ row: Int, _ cell: ExchangeCell, code: String) {
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
