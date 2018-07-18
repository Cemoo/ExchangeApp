//
//  FilterButtton.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 17.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class FilterButtton: UIButtonDesignable {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        UIView.animate(withDuration: 0.3) {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: -45*(.pi / 180))
            } else {
                self.transform = .identity
            }
        }
        return true
    }
}
