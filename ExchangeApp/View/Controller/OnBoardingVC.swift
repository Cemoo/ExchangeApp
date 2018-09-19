//
//  OnBoardingVC.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 19.09.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var horizontalConst: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var horizontalConstTitle: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delay(1) {
            self.animate {
                delay(1, fn: {
                    self.performSegue(withIdentifier: "main", sender: self)
                })
            }
        }
        
    }
    
    func animate(_ comp: @escaping () -> ()) {
        UIView.animate(withDuration: 0.7, animations: {
            self.horizontalConst.constant = -50
            UIView.animate(withDuration: 0.7, animations: {
                self.horizontalConstTitle.constant = 30
                self.lblTitle.alpha = 1
            })
            self.view.layoutIfNeeded()
        }) { (true) in
            delay(0.5, fn: {
                self.shake()
            })
            comp()
        }
    }
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.imgLogo.center.x - 20, y: self.imgLogo.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.imgLogo.center.x + 20, y: self.imgLogo.center.y))
        
        self.imgLogo.layer.add(animation, forKey: "position")
    }
    
    


}
