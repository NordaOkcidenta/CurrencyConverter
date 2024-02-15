//
//  CurrencyScrollView.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//

//TODO: Fix Country flags

import SwiftUI

struct CurrencyScrollView: View {
    
    @Binding var currency: Currency
    
    var dataStore = DataStore()
    
    var body: some View {
        
        
        ScrollView {

            ForEach(Currency.allCases) { currency in //"currency" can be replace with a placeholder "_" underscroll
                    
                CurrencyIcon(currencyImage: currency.image, currencyName: currency.currencyName, countryName: currency.countryName, currencySymbol: currency.currencySymbol, valueAfterConversion: "Place Holder")
                }
            }
                
        }
    }
#Preview {
    CurrencyScrollView(currency: .constant(.USD))
}
