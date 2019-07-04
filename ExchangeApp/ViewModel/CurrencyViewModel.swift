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

protocol CurrencyViewModelProtocol {
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
    
}
