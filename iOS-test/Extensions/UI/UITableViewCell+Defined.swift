//
//  UITableViewCell+Defined.swift
//  iOS-test
//
//  Created by Алина Кошманова on 14.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    //MARK: - Properties
    
    enum ReuseIdentifier {
        
        enum CryptocurrenciesList {
            static let item = "CryptocurrencyTableViewCell"
        }
        
    }
    
    //MARK: - Static
    
    static func nibFor(reuseIdentifier: String) -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
