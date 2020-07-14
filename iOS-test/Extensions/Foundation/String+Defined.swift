//
//  String+Defined.swift
//  iOS-test
//
//  Created by Алина Кошманова on 14.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

extension String {
    
    static let empty = ""
    
    enum Errors {
        static let parsing = "Ошибка формата  данных"
        static let universal = "Ошибка получения  данных"
    }
    
    enum DateFormat {
        static let requestFormat = "yyyy-MM-dd"
    }
    
    enum Alerts {
        
        
        enum Actions {
            static let ok = "Ок"
        }
    }
}
