//
//  ExchangeCell.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 13.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class ExchangeCell: UITableViewCell {
    
    @IBOutlet weak var imgCurrency: UIImageView!
    @IBOutlet weak var lblCurrenyName: UILabel!
    @IBOutlet weak var lblCurAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgCurrency.layer.cornerRadius = 35
        self.imgCurrency.layer.borderColor = UIColor.lightGray.cgColor
        self.imgCurrency.layer.borderWidth = 0.5
        
        self.imgCurrency.clipsToBounds = true
        
        self.imgCurrency.image?.withRenderingMode(.alwaysOriginal)
        self.imgCurrency.tintColor = UIColorFromRGB(0xe2d41d)
    }
}


