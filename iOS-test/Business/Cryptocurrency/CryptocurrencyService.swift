//
//  CryptocurrencyService.swift
//  iOS-test
//
//  Created by Алина Кошманова on 13.07.2020.
//  Copyright © 2020 Алина Кошманова. All rights reserved.
//

import Foundation

class CryptocurrencyService {
    
    //MARK: - Constants
    let startParameterKey = "start"
    let limitParameterKey = "limit"
    let dateParameterKey = "date"
    let apiParameterKey = "X-CMC_PRO_API_KEY"
    
    let getHTTPMethod = "GET"
    
    let apiKey = "d05119ad-6fc4-47c3-8987-55bfe0119cc6"
    let urlPath = "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/historical"
    
    
    //MARK: - Functions
    
    func getCryptocurrencyList(page: Int, success: @escaping((_ list: CryptocurrencyList?) -> Void),  failure: @escaping((_ errorMessage: String) -> Void)) {
        let startIndex = (page - 1) * 30 + 1
        let limit = 30
        let date = "2019-08-18"
        
        var components = URLComponents(string: self.urlPath)
        components?.queryItems = [URLQueryItem(name: self.dateParameterKey, value: date),
                                  URLQueryItem(name: self.startParameterKey, value: startIndex.description),
                                  URLQueryItem(name: self.limitParameterKey, value: limit.description)]
        
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = self.getHTTPMethod
            request.setValue(self.apiKey, forHTTPHeaderField: self.apiParameterKey)

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    (200 ..< 300) ~= response.statusCode,
                    error == nil else {
                        failure(error?.localizedDescription ?? String.Errors.universal)
                        return
                }

                let decoder = JSONDecoder()
                if let currenciesList = try? decoder.decode(CryptocurrencyList.self, from: data) {
                    success(currenciesList)
                    print(currenciesList)
                } else {
                    failure(String.Errors.parsing)
                }
            
            }
            task.resume()
        }
        
    }
}
