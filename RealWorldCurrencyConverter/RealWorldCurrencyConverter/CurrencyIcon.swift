//
//  CurrencyIcon.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/13.
//

import SwiftUI

struct CurrencyIcon: View {
    
    var dataStore = DataStore()
    let currencyImage: ImageResource
    
    //例如USD CNY GBP
    let currencyName: String
    
    let countryName: String
    let currencySymbol: String //例如£€$¥
    var valueAfterConversion: String //例如5150.20
    
    var body: some View {

        HStack {
            //USD
            
            HStack{
                
                if(currencyImage == .china)||(currencyImage == .kr) {
                    Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 55)
                        .clipShape(Circle())
                }else{
                    Image(currencyImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading) {
                    
                    Text(countryName)
                        .font(.body)
                    Text(currencyName)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(Color(red: 254/255, green: 105/255, blue: 156/255))
                    
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text("+2.00%")
                        .font(.caption)
                        .bold()
                        .foregroundStyle(Color.red)
                    Text(currencySymbol+valueAfterConversion)
                        .font(.footnote)
                        .bold()
                    
                }
            }
            .padding()
            
        }
        .frame(width: dataStore.theWidth, height: dataStore.theHeight*0.4)
        .background(Color(red: 244/255, green: 238/255, blue: 249/255))
        .cornerRadius(25)
    }
}

#Preview {
    CurrencyIcon(currencyImage: .us, currencyName: "USD", countryName: "America", currencySymbol: "$", valueAfterConversion: "1234.56")
}
