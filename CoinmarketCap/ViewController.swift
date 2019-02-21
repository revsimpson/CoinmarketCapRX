//
//  ViewController.swift
//  CoinmarketCap
//
//  Created by RichardSimpson on 22/02/2018.
//  Copyright © 2018 Richard Simpson. All rights reserved.
//

import UIKit
import Alamofire
 

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var myTimer = Timer()
    var presenter : CoinPresenterImp!
    var celltype = cellType.normal
    var cellsize = cellSize.normal
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action:
            #selector(ViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTimer = Timer(timeInterval: 600.0, target: self, selector: #selector(ViewController.refresh), userInfo: nil, repeats: true)
        RunLoop.main.add(self.myTimer, forMode: RunLoopMode.defaultRunLoopMode)
        
        presenter = CoinPresenterImp(interactor: CoinInteractorImp(), view: self)
        presenter?.viewDidLoad()
        tableView.addSubview(self.refreshControl)
        tableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: "CoinCell")
        tableView.register(UINib(nibName: "CoinCellSmall", bundle: nil), forCellReuseIdentifier: "CoinCellSmall")
    }
  
    
    @objc func refresh() {
        print("Data refresh")
        presenter.RefreshData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCoinData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: celltype.rawValue)! as! CoinBaseCell
        cell.setData(coin: presenter.getCoinData()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellsize.rawValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedCoinClass.sharedInstance.coin = presenter.getCoinData()[indexPath.row]
        
        let popupVC = setPopupVC(storyboradID:"Main",viewControllerID:"DetailCurrencyID")
        
        popupVC.popupSize = CGSize(width: 310, height: 1)
        popupVC.overlayColor = UIColor(white: 0, alpha: 0.8)
        popupVC.touchDismiss = true
        popupVC.popupAlign = .top
        popupVC.popupAnimation = .bottomBounce
        self.presentPopup(controller: popupVC, completion: nil)
    }
    
    // MARK: Button actions
    @IBAction func showOnlyGreenPressed(_ sender: Any) {
        presenter.removeFilet(filter: .losers)
        presenter.addFilter(filter: .winners)
    }
    
    @IBAction func showOnlyRedPressed(_ sender: Any) {
        presenter.removeFilet(filter: .winners)
        presenter.addFilter(filter: .losers)
    }
    
    @IBAction func Winners24hPressed(_ sender: Any) {
        presenter.removeFilet(filter: .biggestLoss)
        presenter.addFilter(filter: .biggestGains)
    }
    
    @IBAction func Losers24hPressed(_ sender: Any) {
        presenter.removeFilet(filter: .biggestGains)
        presenter.addFilter(filter: .biggestLoss)
        
    }
    
    @IBAction func SmallClicked(_ sender: Any) {
        celltype = cellType.small
        cellsize = cellSize.small
        tableView.reloadData()
    }
    
    @IBAction func bigClicked(_ sender: Any) {
        celltype = cellType.normal
        cellsize = cellSize.normal
        tableView.reloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
         presenter.RefreshData()
         refreshControl.endRefreshing()
    }
}

extension ViewController : CoinView {
    
    @objc func dataLoaded() {
        tableView.reloadData()
    }
    
    func setSpinner(on: Bool) {
        // do something
    }
}

