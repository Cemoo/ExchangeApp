//
//  Currency.swift
//  ExchangeApp
//
//  Created by Cemal BAYRI on 6/23/19.
//  Copyright © 2019 Cemal BAYRI. All rights reserved.
//

import Foundation

struct Currency: Decodable {
    var name: String?
    var code: String?
    var todayLowestBuyPrice: Decimal?
    var todayHighestBuyPrice: Decimal?
    var todayLowestSellPrice: Decimal?
    var todayHighestSellPrice: Decimal?
    var yesterdayClosingBuyPrice: Decimal?
    var yesterdayClosingSellPrice: Decimal?
    var buyPrice: Decimal?
    var sellPrice: Decimal?
    var dailyChange: Decimal?
    var dailyChangePercentage: Decimal?
    var lastUpdateDate: String?
    
}

/*
 name: "Ethereum Classic",
 code: "ETC",
 todayLowestBuyPrice: 8.346799850463867,
 todayHighestBuyPrice: 9.58810043334961,
 todayLowestSellPrice: 8.346799850463867,
 todayHighestSellPrice: 9.58810043334961,
 yesterdayClosingBuyPrice: 8.716699600219727,
 yesterdayClosingSellPrice: 8.716699600219727,
 buyPrice: 9.402700424194336,
 sellPrice: 9.402700424194336,
 dailyChange: 0.6860008239746094,
 dailyChangePercentage: 0.07869960597900115,
 lastUpdateDate: "23-06-2019 23:18:44"
 */
