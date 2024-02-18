//
//  EachCurrency.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//

import Foundation
import SwiftUI


//CaseIterable can turn the 'enum' into an 'array'
//CaseIterable is a type that provides a collection of all its values
enum Currency: Double, CaseIterable, Identifiable {
    
    case USD = 1
    case EUR = 0.89
    case JPY = 115.59
    case GBP = 0.75
    case AUD = 1.32
    case CAD = 1.25
    case CHF = 0.92
    case CNY = 6.37
    case KWD = 0.302
    case KRW = 1173.50
    case BTC = 0.000019//Bitcoin,₿
    case ETH = 0.000363576//Ethereum,Ξ
    
    var id: Currency {
        self
    }
    
    var image: ImageResource {
        
        switch self {
        case .ETH:
                .ethereum
        case .USD:
                .us
        case .CNY:
                .china
        case .EUR:
                .eu
        case .JPY:
                .jp
        case .GBP:
                .gb
        case .AUD:
                .au
        case .CAD:
                .ca
        case .CHF:
                .ch
        case .KWD:
                .kw
        case .KRW:
                .kr
        case .BTC:
                .bitcoin
        }
        
    }
    
    var countryName: String {
        
        switch self {
        case .ETH:
            "Ethereum"
        case .USD:
            "America"
        case .CNY:
            "China"
        case .EUR:
            "Europe"
        case .JPY:
            "Japan"
        case .GBP:
            "Britain"
        case .AUD:
            "Australia"
        case .CAD:
            "Canada"
        case .CHF:
            "Switzerland"
        case .KWD:
            "Kuwait"
        case .KRW:
            "South Korea"
        case .BTC:
            "Bitcoin"
        }
    }
    
    var currencySymbol: String {
        switch self {
        case .ETH:
            return "Ξ"
        case .USD:
            return "$"
        case .CNY:
            return "¥"
        case .EUR:
            return "€"
        case .JPY:
            return "¥"
        case .GBP:
            return "£"
        case .AUD:
            return "$"
        case .CAD:
            return "$"
        case .CHF:
            return "₣"
        case .KWD:
            return "د.ك"
        case .KRW:
            return "₩"
        case .BTC:
            return "₿"
        }
    }

    var currencyName: String {
        
        switch self {
        case .ETH:
            "ETH"
        case .USD:
            "USD"
        case .CNY:
            "CNY"
        case .EUR:
            "EUR"
        case .JPY:
            "JPY"
        case .GBP:
            "GBP"
        case .AUD:
            "AUD"
        case .CAD:
            "CAD"
        case .CHF:
            "CHF"
        case .KWD:
            "KWD"
        case .KRW:
            "KRW"
        case .BTC:
            "BTC"
        }
    }
        var code: String {
            currencyName.lowercased()
        }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        let amountStringWithNoCommas = amountString.replacingOccurrences(of: ",", with: "")
        
        guard let doubleAmount = Double(amountStringWithNoCommas) else {
            return "0.00"
        }
        
        let convertedAmount = doubleAmount / self.rawValue * currency.rawValue
        
        if (convertedAmount < 0.01) && (convertedAmount > 0){
            return "<0.01"
        }
        
        if (convertedAmount == 0) {
            return "0.00"
        }
        
        //这段代码先注释掉因为最终需要实现的效果是有小数点的
//        if (convertedAmount.truncatingRemainder(dividingBy: 1) == 0)||(convertedAmount.truncatingRemainder(dividingBy: 1) < 0.01) {
//            return String(format: "%.0f", convertedAmount)
//        }
        
        return String(format: "%.2f", convertedAmount)
    }
    
    
    func addComma(_ amountStringWithNoCommas: String) -> String {
        
    }
    
}
