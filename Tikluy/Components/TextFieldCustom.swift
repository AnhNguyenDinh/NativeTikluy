//
//  TextFieldCustom.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 8/8/25.
//

import SwiftUI

struct TextFieldCustom: View {
        var label: String
        var placeholder: String
        @Binding var text: String
        var icon: String? = nil ?? "phone"
        var maxLength: Int = 5
        var isSecure: Bool =  false
        @FocusState private var focusState :Bool
    
    
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(label)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                
                HStack {
                    if let icon = icon {
                        Image(systemName:icon)
                            .frame(width: 30, height: 30, alignment: Alignment.center)
//                            .foregroundColor(.gray)
                    }
                    
                    VStack{
                        if !isSecure {
                            TextField(placeholder, text: $text)
                                .focused($focusState)
                                
                        }
                        else{
                            SecureField(placeholder,text: $text)
                                .focused($focusState)
                        }
                        Rectangle() // Đây là viền dưới
                            .fill(focusState ? Color.black : Color.gray)
                            .frame(height: 2)
                    }
//                    TextField(placeholder, text: $text)
                }
//                .padding(.horizontal, 10)
//                Rectangle() // Đây là viền dưới
//                    .fill(Color.gray)
//                    .frame(height: 1)
               
            }
        }
}

#Preview {
    TextFieldCustom(label: "Label", placeholder: "", text: .constant(""))
}
