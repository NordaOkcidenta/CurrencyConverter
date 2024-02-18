//
//  NumberPad.swift
//  test
//
//  Created by Johnathan Tang on 2/14/24.
//
import SwiftUI

struct NumberPad: View {
    @Binding var value: String
    
    let keys = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        [".", "0", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { digit in
                        NumberPadButton(digit: digit) {
                            self.buttonTapped(digit)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func buttonTapped(_ digit: String) {
            switch digit {
            case "." where value.contains("."):
                // 如果已经包含小数点，则忽略
                break
            case "." where !value.contains("."):
                // 添加小数点，并确保其前有数字
                value = value.isEmpty ? "0." : value + "."
            case "⌫":
                // 如果当前值不是 "0.00"，则删除最后一个字符
                if value != "0.00" {
                    value.removeLast()
                }
                // 如果删除后为空或为 "0."，则重置为 "0.00"
                if value.isEmpty || value == "0." {
                    value = "0.00"
                }
            case _ where value == "0" || value == "0.00":
                // 如果当前值是 "0" 或 "0.00"，且输入不是 ".", 则替换初始的 "0" 或 "0.00"
                value = digit == "." ? "0." : digit
            case _ where value.contains(".") && value.components(separatedBy: ".")[1].count >= 2:
                // 如果已经有小数点且小数部分已经有两位数字，则忽略后续输入
                break
            default:
                // 添加新的数字，并重新格式化
                value += digit
                value = formatNumberString(value)
            }
        }
    
    private func formatNumberString(_ string: String) -> String {
            // 分开整数和小数部分
            let parts = string.components(separatedBy: ".")
            let integerPart = parts[0]
            let decimalPart = parts.count > 1 ? "." + parts[1] : ""
            
            // 格式化整数部分
            if let integer = Int(integerPart.replacingOccurrences(of: ",", with: "")) {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                let formattedInteger = formatter.string(from: NSNumber(value: integer)) ?? ""
                return formattedInteger + decimalPart
            }
            
            return string
        }
}

#Preview {
    NumberPad(value: .constant("0"))
                .previewLayout(.sizeThatFits)
}

