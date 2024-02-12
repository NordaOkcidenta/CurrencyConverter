//
//  SelectCurrency.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/12.
//

import SwiftUI

struct SelectCurrency: View {
    
    var body: some View {
        
        ZStack {
            
            HStack{
            
                
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color(red: 230/255, green: 193/255, blue: 148/255), location: 0),
                    .init(color: Color(red: 221/255, green: 99/255, blue: 186/255), location: 0.5),
                    .init(color: Color(red: 129/255, green: 55/255, blue: 219/255), location: 1)
                ]), startPoint: .bottomTrailing, endPoint: .topLeading)
                    .frame(width: 321.625, height: 203.5)
                    .cornerRadius(25)
                    .opacity(0.5)
                    .padding(.top, 7)
                    .blur(radius: 10)
                
            }
            
            HStack {
                Spacer()
                
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color(red: 129/255, green: 55/255, blue: 219/255), location: 0),
                    .init(color: Color(red: 221/255, green: 99/255, blue: 186/255), location: 0.5),
                    .init(color: Color(red: 230/255, green: 193/255, blue: 148/255), location: 1)
                ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                //方块长宽比符合黄金比例
                .frame(width: 320.625, height: 202.5)
                .cornerRadius(25)
                
                Spacer()
            }
            .padding()
            
        }
    }
    
}

#Preview {
    SelectCurrency()
}
