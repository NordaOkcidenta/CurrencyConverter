//
//  SelectCurrency.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//

import SwiftUI

class DataStore: ObservableObject {
    var theWidth: Double = 360.625
    
    // 不使用@Published
    var theHeight: Double {
        return theWidth * 0.63
    }
}


struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var currentSelectionCurrency: Currency
    
    // 此处声明你的ObservableObject
    var dataStore = DataStore()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            //            HStack{
            //
            //                Image(systemName: "list.dash")
            //                    .font(.title)
            //                    .bold()
            //                    .padding()
            //
            //                Image
            //
            //            }
            
            ZStack {
                
                HStack{
                    
                    
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: Color(red: 230/255, green: 193/255, blue: 148/255), location: 0),
                        .init(color: Color(red: 221/255, green: 99/255, blue: 186/255), location: 0.5),
                        .init(color: Color(red: 129/255, green: 55/255, blue: 219/255), location: 1)
                    ]), startPoint: .bottomTrailing, endPoint: .topLeading)
                    .frame(width: dataStore.theWidth, height: dataStore.theHeight)
                    .cornerRadius(25)
                    .opacity(0.7)
                    .padding(.top, 15)
                    .blur(radius: 10)
                    
                }
                
                HStack {
                    Spacer()
                    
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: Color(red: 129/255, green: 55/255, blue: 219/255), location: 0),
                        .init(color: Color(red: 221/255, green: 99/255, blue: 186/255), location: 0.33),
                        .init(color: Color(red: 236/255, green: 118/255, blue: 134/255), location: 0.66),
                        .init(color: Color(red: 230/255, green: 193/255, blue: 148/255), location: 1)
                    ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                    //黄金比例
                    .frame(width: dataStore.theWidth, height: dataStore.theHeight)
                    .cornerRadius(25)
                    .overlay(
                        
                        VStack {
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    Text("Current Selection")
                                        .foregroundColor(Color.white)
                                        .font(.caption)
                                    
                                    HStack {
                                        Image(systemName: "dollarsign")
                                            .font(.title3)
                                            .foregroundColor(Color.white)
                                            .bold()
                                        
                                        Text("5,750.20")
                                            .font(.title2)
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .padding(.leading, -7)
                                    }
                                }
                                
                                Spacer()
                                
                                Image(.appleLogoWhiteSvg)
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0.7)
                                    .frame(width: 30)
                                    .padding(.top,-3)
                                
                            }
                            
                            Spacer()
                            
                            HStack(/*将里面的所有子HStack靠下对齐*/alignment: .bottom) {
                                
                                HStack(/*将text与左边$对齐*/alignment: .bottom) {
                                    Image(systemName: "dollarsign.arrow.circlepath")
                                        .foregroundStyle(Color.white)
                                        .font(.title3)
                                    Text("USD")
                                        .foregroundStyle(Color.white)
                                        .font(.caption2)
                                        .padding(.leading, -5)
                                        .bold()
                                    
                                }
                                
                                
                                
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                        //TBD
                                        
                                    }) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(Color.white.opacity(0.4))
                                            
                                            HStack {
                                                Text("Done")
                                                    .foregroundColor(Color.white)
                                                    .bold()
                                                    .frame(width: 90, height: 40)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.up.chevron.down")
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .font(.caption2)
                                                    .padding(.leading, -20)
                                            }
                                            .padding(.horizontal, 10)
                                        }
                                    }
                                    .frame(width: 110, height: 40)
                                    
                                }
                            }
                            
                            
                        }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 27)
                    )
                    
                    Spacer()
                }
                .padding()
                
            }
            
            VStack(alignment: .leading){
                Text("Converted Rates")
                    .font(.title3)
                    .bold()
                    .padding(.leading, 25)
                    .padding(.top, 25)
            }
        }
        CurrencyScrollView(currency: $currentSelectionCurrency)
    }
    
}

#Preview {
    SelectCurrency(currentSelectionCurrency: .constant(.CAD))
}
