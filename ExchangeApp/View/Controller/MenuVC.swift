//
//  MenuVC.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 13.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBOutlet weak var tbMenu: UITableView!
    
    let list = ["Dövizler", "Altın Fiyatları", "Borsa İstanbul", "Kripto Coin", "Döviz Çevirici", "Alarmlar"]
    let listImages = [#imageLiteral(resourceName: "currencies"),#imageLiteral(resourceName: "gold"),#imageLiteral(resourceName: "banking"),#imageLiteral(resourceName: "coin"),#imageLiteral(resourceName: "shuffle"),#imageLiteral(resourceName: "alarm")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tbMenu.delegate = self
        tbMenu.dataSource = self
        tbMenu.tableFooterView = UIView()
        
    }

    var interactor:Interactor? = nil
    var menuActionDelegate:MenuActionDelegate? = nil
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .left)
        
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeMenu(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func delay(seconds: Double, completion:@escaping ()->()) {
        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) {
            completion()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        dismiss(animated: true){
            self.delay(seconds: 0.5){
                self.menuActionDelegate?.reopenMenu()
            }
        }
    }
    
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbMenu.dequeueReusableCell(withIdentifier: "menu", for: indexPath) as! MenuCell
        cell.lblMenu.text = list[indexPath.row]
        cell.imgMenu.image = listImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            selection = MenuSelection.exchange
            break
        case 1:
            selection = MenuSelection.gold
            break
        case 2:
            selection = MenuSelection.stockMarket
            break
        case 3:
            selection = MenuSelection.crypto
            break
        case 4:
            selection = MenuSelection.exchange
            break
        case 5:
            selection = MenuSelection.exchangeConvertor
            break
        default:
            selection = MenuSelection.alarms
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
