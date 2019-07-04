//
//  MainVC.swift
//  ExchangeApp
//
//  Created by Erencan Evren on 13.07.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

protocol MenuActionDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?)
    func reopenMenu()
}

class MainVC: UIViewController {
    
    @IBOutlet weak var tbExchanges: UITableView!
    @IBOutlet weak var menuView: UIViewDesignable!
    
    
    let interactor = Interactor()
    //let exViewModel = ExchangeViewModel()
    
    var model: CurrencyViewModelProtocol! {
        didSet {
            model.delegate = self
        }
    }
    
    internal var currencies: [Currency] = [] {
        didSet {
            self.tbExchanges.reloadData()
        }
    }
    
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       // view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
       directPageOrStayHere()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //model.models = []
    }
    
    @IBAction func edgeGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .right)
        
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                self.performSegue(withIdentifier: "menu", sender: nil)
        }
    }
    
    @IBAction func btnOpenAction(_ sender: Any) {
        self.performSegue(withIdentifier: "menu", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MenuVC {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
            destinationViewController.menuActionDelegate = self
        }
    }
    
    private func setupTableView() {
        tbExchanges.delegate = self
        tbExchanges.dataSource = self
        refresh.addTarget(self, action: #selector(self.fetchData), for: .valueChanged)
        self.tbExchanges.addSubview(refresh)
        
    }
    
    private func directPageOrStayHere() {
        if selection == .exchangeConvertor {
            self.performSegue(withIdentifier: "convert", sender: self)
        } else if selection == .alarms {
            fetchData()
        } else {
            fetchData()
        }
    }
    
    @objc private func fetchData() {
        model.load()
    }
    
    @IBAction func btnFilterAction(_ sender: FilterButtton) {
        UIView.animate(withDuration: 0.2) {
            if self.menuView.transform == .identity {
                self.menuView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
            } else {
                self.menuView.transform = .identity
            }
        }
    }
    
}

extension MainVC: ServiceOutputDelegate {
    func handleViewModelOutput(_ output: ServiceOutput) {
        switch output {
        case .showLoading(let res):
           UIApplication.shared.isNetworkActivityIndicatorVisible = res
        case .showData(let data):
            currencies = data
            refresh.endRefreshing()
        case .showError(let err):
            print(err)
        }
    }
}

extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbExchanges.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExchangeCell
        cell.lblCurrenyName.text = currencies[indexPath.row].name ?? ""
        cell.lblCurAmount.text = "\(currencies[indexPath.row].buyPrice ?? 0.0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension MainVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

extension MainVC : MenuActionDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?) {
        dismiss(animated: true){
            self.performSegue(withIdentifier: segueName, sender: sender)
        }
    }
    func reopenMenu(){
        self.performSegue(withIdentifier: "menu", sender: nil)
    }
}

