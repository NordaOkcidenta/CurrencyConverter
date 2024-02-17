//
//  GetExchangeRates.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/17.
//

import Foundation

class CurrencyConverter {
    static func fetchCurrencyRate(from base: Currency, to currency: Currency, completion: @escaping (Double?) -> Void) {
        let urlString = "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/\(base.code)/\(currency.code).json"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let rates = jsonResult["rates"] as? [String: Double],
                   let rate = rates[currency.code] {
                    completion(rate)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}
