//
//  TextFieldCustom.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 8/8/25.
//

import SwiftUI

struct TextFieldCustom<RightContent: View>: View {
        var label: String
        var placeholder: String
        @Binding var text: String
        var icon: String? = nil ?? "phone"
        var maxLength: Int = 5
        var isSecure: Bool =  false
        @FocusState private var focusState :Bool
        var rightView: RightContent?
        init(label: String,
            placeholder: String,
            text: Binding<String>,
            icon: String? = "phone",
            maxLength: Int = 20,
            isSecure: Bool = false,
            @ViewBuilder rightView: () -> RightContent? = { EmptyView() }) {
            self.label = label
                   self.placeholder = placeholder
                   self._text = text
                   self.icon = icon
                   self.maxLength = maxLength
                   self.isSecure = isSecure
                   self.rightView = rightView()
        }
    
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(label)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                ZStack(alignment: .trailing) {
                    HStack(spacing:0) {
                        if let icon = icon {
                            Image(systemName:icon)
                                .frame(width: 34, height: 34, alignment: Alignment.center)
//                                .background(.gray)
                        }
                        
                        VStack (spacing:0){
                            if !isSecure {
                                TextField(placeholder, text: $text)
                                    .focused($focusState)
                                    .frame(height:34)
//                                    .background(.red)
                                    
                            }
                            else{
                                SecureField(placeholder,text: $text)
                                    .focused($focusState)
                                    .frame(height:34)
//                                    .background(.red)
                            }
                            Rectangle()
                                .fill(focusState ? Color.black : Color.gray)
                                .frame(height: 2)
                        }
                           
                    }
                    if let rightView = rightView {
                        rightView.offset(x: -10, y: -5)
//                            .zIndex(20)
                    }
                }
         
               
            }
        }
}

#Preview {
//    TextFieldCustom(label: "Label", placeholder: "", text: .constant(""))
    TextFieldCustom(label: "", placeholder: "", text: .constant(""), icon: "phone", maxLength: 5, isSecure: true) {
        ProgressView()
    }
}
