//
//  CurrencyScrollView.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//


import SwiftUI

struct CurrencyScrollView: View {
    
    @Binding var currency: Currency
    @State var standardCurrency: Currency = .USD
    @Binding var fromCurrencyAmount: String
    
    var dataStore = DataStore()
    
    var body: some View {
        
        ScrollView {

            ForEach(Currency.allCases) { currency in //"currency" can be replace with a placeholder "_" underscroll
                    
                CurrencyIcon(currencyImage: currency.image, currencyName: currency.currencyName, countryName: currency.countryName, currencySymbol: currency.currencySymbol, valueAfterConversion: standardCurrency.convert(fromCurrencyAmount, to: currency))
                }
            }
                
        }
    }
#Preview {
    CurrencyScrollView(currency: .constant(.USD), fromCurrencyAmount: .constant("1000.00"))
}
