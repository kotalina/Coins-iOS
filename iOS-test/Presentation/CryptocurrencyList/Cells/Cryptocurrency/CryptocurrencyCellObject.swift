//
//  CryptocurrencyCellObject.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class CryptocurrencyCellObject {
   
    //MARK: - Constants
    let reuseIdentifier = "CryptocurrencyTableViewCell"
    
    //MARK: - Properties
    var name: String?
    var dollarExchangeRate: String?
    var changeForHourValue: String?
    
    
    //MARK: - Init
    
    init(name: String?, dollarExchangeRate: String?, changeForHourValue: String?) {
        self.name = name
        self.dollarExchangeRate = dollarExchangeRate
        self.changeForHourValue = changeForHourValue
    }
    
}


//MARK: - BaseTableViewCellObject

extension CryptocurrencyCellObject: BaseTableViewCellObject {
    
    func cellReuseIdentifier() -> String {
        return self.reuseIdentifier
    }
    
    func height() -> CGFloat {
        return UITableView.automaticDimension
    }
}
