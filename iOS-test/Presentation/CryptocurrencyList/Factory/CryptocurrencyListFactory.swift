//
//  CryptocurrencyListFactory.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

class CryptocurrencyListFactory {
    
    func cryptocurrencyCellObject(cryptocurrencyList: [CryptocurrencyElement]) -> [CryptocurrencyCellObject] {
        
        var cellObjects:[CryptocurrencyCellObject] = []
        
        for cryptocurrency in cryptocurrencyList {
            let cryptocurrencyObject = self.cryptocurrencyCellObject(name: cryptocurrency.name,
                                                                     dollarExchangeRate: cryptocurrency.quote?.USD?.price?.description,
                                                                     changeForHourValue: cryptocurrency.quote?.USD?.percent_change_1h?.description)
            cellObjects.append(cryptocurrencyObject)
        }
        
        return cellObjects
    }
    

    //MARK: - CryptocurrencyCellObject
    
    private func cryptocurrencyCellObject(name: String?, dollarExchangeRate: String?, changeForHourValue: String?) -> CryptocurrencyCellObject {
        return CryptocurrencyCellObject(name: name, dollarExchangeRate: dollarExchangeRate, changeForHourValue: changeForHourValue)
    }
}
