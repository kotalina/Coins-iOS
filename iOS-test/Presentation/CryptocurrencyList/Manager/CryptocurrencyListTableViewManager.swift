//
//  CryptocurrencyListTableViewManager.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit


protocol CryptocurrencyListTableViewManagerDelegate {
    func loadCurrenciesForNextPage()
}


class CryptocurrencyListTableViewManager: NSObject {
    
    //MARK: - Propetries
    private var tableView: UITableView?
    private var cellObjects: [BaseTableViewCellObject]?
    private var delegate: CryptocurrencyListTableViewManagerDelegate?
    var isNextPageLoading = false
    
    
    //MARK: - Incapsulation
    
    func set(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(UITableViewCell.nibFor(reuseIdentifier: UITableViewCell.ReuseIdentifier.CryptocurrenciesList.item),
                                 forCellReuseIdentifier: UITableViewCell.ReuseIdentifier.CryptocurrenciesList.item)
    }
    
    func set(delegate: CryptocurrencyListTableViewManagerDelegate?) {
        self.delegate = delegate
    }
    
    
    //MARK: - Functions
    
    func updateWith(cellObjects: [BaseTableViewCellObject]) {
        self.isNextPageLoading = false
        self.cellObjects = cellObjects
        self.tableView?.reloadData()
    }
    
    func reloadData() {
        self.tableView?.reloadData()
    }
}


//MARK: - UITableViewDelegate

extension CryptocurrencyListTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellObjects?[indexPath.row].height() ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > (self.cellObjects?.count ?? 0) - 5 && !self.isNextPageLoading{
            self.isNextPageLoading = true
            self.delegate?.loadCurrenciesForNextPage()
        }
    }
    
}


//MARK: - UITableViewDataSource

extension CryptocurrencyListTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellObject = self.cellObjects?[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellObject.cellReuseIdentifier(), for: indexPath) as? CryptocurrencyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureWith(cellObject: cellObject)
        return cell
    }
    
}
