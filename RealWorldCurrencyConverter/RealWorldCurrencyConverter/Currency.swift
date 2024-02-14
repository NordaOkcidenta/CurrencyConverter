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
    
    var id: Currency {
        self
    }
    
    var image: ImageResource {
        
        switch self {
        case .USD:
                .us
        case .CNY:
                .cn
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
        }
        
    }
    
    var countryName: String {
        
        switch self {
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
        }
    }
    
    var currencySymbol: String {
        switch self {
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
        }
    }

    var currencyName: String {
        
        switch self {
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
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = doubleAmount / self.rawValue * currency.rawValue
        
        if (convertedAmount < 0.01) && (convertedAmount > 0){
            return "< 0.01"
        }
        
        if (convertedAmount == 0) {
            return ""
        }
        
        //获取除以1的余数
        if (convertedAmount.truncatingRemainder(dividingBy: 1) == 0)||(convertedAmount.truncatingRemainder(dividingBy: 1) < 0.01) {
            return String(format: "%.0f", convertedAmount)
        }
        
        return String(format: "%.2f", convertedAmount)
    }
    
}
