//
//  CryptocurrencyListViewController.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class CryptocurrencyListViewController: UITableViewController {
    
    //MARK: - Properties
    var cryptocurrencyList: [CryptocurrencyElement] = []
    var manager: CryptocurrencyListTableViewManager?
    var service = CryptocurrencyService()
    var factory = CryptocurrencyListFactory()
    var currentPage = 1
    
    //MARK: - Outlets
    var activiryIndicator: UIActivityIndicatorView!
    
    
    //MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.configureView()
        self.needToShowLoading(isNeedToShow: true)
        self.updateCurrencyList(page: self.currentPage)
    }
    
    
    //MARK: - Private functions
    
    private func updateCurrencyList(page: Int, needRefresh: Bool = false) {
        self.service.getCryptocurrencyList(page: page, success: { (currenciesList) in
            
            if let list = currenciesList?.data {
               
                if needRefresh {
                    self.cryptocurrencyList = list
                } else {
                    self.cryptocurrencyList.append(contentsOf: list)
                }
                
                DispatchQueue.main.async {
                    self.updateCells()
                    self.needToShowLoading(isNeedToShow: false)
                }
            }
        
        }) { (errorMessage) in
            DispatchQueue.main.async {
                self.needToShowLoading(isNeedToShow: false)
                self.showErrorAlert(message: errorMessage)
            }
        }
    }
    
    private func updateCells() {
        
        let cellObjects = self.factory.cryptocurrencyCellObject(cryptocurrencyList: self.cryptocurrencyList)
        self.manager?.updateWith(cellObjects: cellObjects)
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: String.Alerts.Actions.ok, style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func needToShowLoading(isNeedToShow: Bool) {        
        if isNeedToShow {
            self.activiryIndicator.startAnimating()
        } else {
            self.activiryIndicator.stopAnimating()
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.updateCurrencyList(page: 1, needRefresh: true)
        self.tableView.refreshControl?.endRefreshing()
    }
    
    //MARK: - Configurations functions
    
    private func configureView() {
        self.configureTableViewManager()
        self.configureRefreshControl()
        self.configureActivityIndicator()
    }
    
    private func configureTableViewManager() {
        self.manager = CryptocurrencyListTableViewManager()
        self.manager?.set(tableView: self.tableView)
        self.manager?.set(delegate: self)
        self.tableView.delegate = self.manager
        self.tableView.dataSource = self.manager
    }
    
    private func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    private func configureActivityIndicator() {
        self.activiryIndicator = UIActivityIndicatorView(frame: self.view.bounds)
        self.activiryIndicator.center = self.view.center
        self.activiryIndicator.hidesWhenStopped = true
        self.tableView.addSubview(self.activiryIndicator)
        self.tableView.bringSubviewToFront(self.activiryIndicator)
    }
}


//MARK: - CryptocurrencyListTableViewManagerDelegate

extension CryptocurrencyListViewController: CryptocurrencyListTableViewManagerDelegate {
    
    func loadCurrenciesForNextPage() {
        self.currentPage += 1
        self.updateCurrencyList(page: self.currentPage)
    }
    
    
}
