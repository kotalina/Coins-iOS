//
//  Date+Helpers.swift
//  iOS-test
//
//  Created by Алина Кошманова on 14.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

extension Date {
    
    func dateToString(dateFormat: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
}
