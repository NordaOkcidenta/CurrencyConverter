//
//  ContentView.swift
//  RealWorldCurrencyConverter
//
//  Created by SamLi on 2024/2/11.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSelectCurrency = false
    
    var body: some View {
        
        Button{
            
            showSelectCurrency.toggle()
            
        } label: {
            
            Text("Test")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.white)
            
        }
        .frame(width: 200, height: 100)
        .background(Color.gray)
        .clipShape(Capsule())
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency()
        }
        
    }
}

#Preview {
    ContentView()
}
