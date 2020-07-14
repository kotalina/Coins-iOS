//
//  CryptocurrencyModel.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

struct CryptocurrencyElement: Codable {
    var name: String?
    var quote: QuoteElement?
    
    struct QuoteElement: Codable {
        var USD: USDElement?
        
        struct USDElement: Codable {
            var price: Float?
            var percent_change_1h: Float?
        }
    }
    
}

