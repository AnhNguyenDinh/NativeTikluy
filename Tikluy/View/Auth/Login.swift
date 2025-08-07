//
//  Login.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 7/8/25.
//

import SwiftUI
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let widthLogo = screenWidth * 0.3
let heightLogo =  widthLogo / 1.16
struct Login: View {
    var body: some View {
        GeometryReader{geometry in
            let safeAreaTop = geometry.safeAreaInsets.top
            ZStack {
                ScrollView{
                    VStack {
                        Spacer().frame(height:screenWidth * 0.2)
                        Image("logo_small")
                            .resizable()
                            .frame(width: widthLogo, height:heightLogo)
                        Spacer().frame(height:40)
                        TextField("Số điện thoại", text: .constant(""))
                            .padding(.vertical,0)
                        Rectangle() // Đây là viền dưới
                                       .fill(Color.gray)
                                       .frame(height: 1)
                        Spacer().frame(height:40)
                        SecureField("Mật khẩu",text: .constant(""))
//
        
                        
                    }
                    .padding(.horizontal, 40)
    //                .frame(maxWidth: .infinity, minHeight: screenHeight)
                }
                .padding(.top, safeAreaTop)
                
                
            
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity )
            .background(
                Image("bg_new_home")
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
            )
            .ignoresSafeArea(.all)
        }
    
    }
}

#Preview {
    Login()
}
