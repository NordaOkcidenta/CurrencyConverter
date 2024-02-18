//
//  NumberPadButton.swift
//  test
//
//  Created by Johnathan Tang on 2/14/24.
//

import SwiftUI

struct NumberPadButton: View {
    let digit: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            // 设置按钮背景为透明
            Color.clear
                // 覆盖层，原角正方形涂满
                .overlay(RoundedRectangle(cornerRadius: 12)
                // 颜色只描边，stroke 描边
                .stroke(Color.accentColor))
                // 覆盖层，数字
                .overlay(Text(digit))
        }
    }
}

#Preview {
    NumberPadButton(digit: "1", action: {})
        .padding()
        .frame(width: 80, height: 80)
        .previewLayout(.sizeThatFits)
}

