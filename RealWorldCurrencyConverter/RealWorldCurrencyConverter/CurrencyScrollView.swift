//
//  CurrencyScrollView.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//

import SwiftUI

struct CurrencyScrollView: View {
    
    @Binding var currency: Currency
    
    var dataStore = DataStore()
    
    var body: some View {
        
        
        ScrollView {
                        
                
                HStack {
                    //USD
                    
                    HStack{
                        
                        Image(.us)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 62)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            
                            Text("America")
                                .font(.body)
                            Text("USD")
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
                            Text("$5750.20")
                                .font(.footnote)
                                .bold()
                            
                        }
                    }
                    .padding()
                    
                }
                .frame(width: dataStore.theWidth, height: dataStore.theHeight*0.4)
                .background(Color(red: 244/255, green: 238/255, blue: 249/255))
                .cornerRadius(25)
                
            
            HStack {
                //USD
                
                HStack{
                    
                    Image(.jp)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        
                        Text("Japan")
                            .font(.body)
                        Text("JPY")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(Color(red: 254/255, green: 105/255, blue: 156/255))
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        
                        Text("+1.20%")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(Color.red)
                        Text("$42000.30")
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
    
}
#Preview {
    CurrencyScrollView(currency: .constant(.USD))
}
