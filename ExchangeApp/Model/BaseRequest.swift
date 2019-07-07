//
//  BaseRequest.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 16.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit
import Alamofire
let manager = Alamofire.Session.default

func baseRequest(params: [String: Any]? = nil, requestURL: URL = exchangeUrl, method: HTTPMethod = .get, encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping (Data?) ->()) {
    manager.session.configuration.timeoutIntervalForRequest = 30
    let headers: HTTPHeaders = ["Content-Type":"application/json"]
    manager.request(requestURL, method: method, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
        if isInternetAvailable() {
            if let data = response.data {
                switch response.result {
                case .success:
                    completion(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(nil)
                }
            }
        }
    }
}
