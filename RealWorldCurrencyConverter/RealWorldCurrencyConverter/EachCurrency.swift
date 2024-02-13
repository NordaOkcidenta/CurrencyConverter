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
    
    var id: Currency {
        self
    }
    
    var image: ImageResource {
        
        switch self {
        case .USD:
                .us
        }
        
    }
    
    var CountryName: String {
        
        switch self {
        case .USD:
            "America"
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
