//
//  CryptocurrencyTableViewCell.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

class CryptocurrencyTableViewCell: UITableViewCell {
    
    enum DefaultValueString {
        static let name = "Без названия"
        static let dollarExchangeRate = "Нет данных"
        static let changeForHour = "Нет данных"
    }
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dollarExchangeRateLabel: UILabel!
    @IBOutlet weak var changeForHourLabel: UILabel!
    
}


//MARK: - BaseTableViewCell

extension CryptocurrencyTableViewCell: BaseTableViewCell {
    
    func configureWith(cellObject: BaseTableViewCellObject) {
        if let cellObject = cellObject as? CryptocurrencyCellObject {
            self.nameLabel.text = cellObject.name ?? DefaultValueString.name
            self.dollarExchangeRateLabel.text = cellObject.dollarExchangeRate ?? DefaultValueString.dollarExchangeRate
            self.changeForHourLabel.text = cellObject.changeForHourValue ?? DefaultValueString.changeForHour
        }
    }
    
}

