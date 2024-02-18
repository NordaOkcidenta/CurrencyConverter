//
//  ContentView.swift
//  test
//
//  Created by Johnathan Tang on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = "0.00"

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Image(systemName: "arrow.right.arrow.left")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red) // 设置图标颜色为红色
                                .frame(width: 36, height: 36) // 设置图标大小
//                                .padding(.vertical,100) // 确保图标在 VStack 中居中
            }
            .padding()
            .border(Color.black)
//            .overlay(RoundedRectangle(cornerRadius: 12)
//            .stroke(Color.accentColor))
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("You have:")
                        Text(inputValue)
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("AUD")
                            .padding(.all, 8)
                    }
                }
                .padding()
                .border(Color.black)
                
                        
//                Divider()
                        
                HStack {
                    VStack(alignment: .leading) {
                        Text("You get:")
                        Text("5,975.20")
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("USD")
                            .padding(.all, 8)
                    }
                }
                .padding()
                .border(Color.black)
            }
//            .overlay(RoundedRectangle(cornerRadius: 12)
//            .stroke(Color.accentColor))

        }
        .padding()
        .cornerRadius(20)
        .shadow(radius: 5)
        
        Spacer()
        
        Divider()

        VStack {
            NumberPad(value: $inputValue)
        }
        .padding()
        .frame(width: 500, height: 500)
    }
}

#Preview {
    ContentView()
}
