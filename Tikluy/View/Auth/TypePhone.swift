//
//  TypePhone.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 13/8/25.
//

import SwiftUI

struct TypePhone: View {
    var sdt: String
    @State private var username: String
    
    init(sdt:String){
        self.sdt = sdt
        _username = State(initialValue: sdt)
    }
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    HeaderLogoFull()
                    VStack {
                        
                        Spacer().frame(height: 40)
                        Text("MỞ TÀI KHOẢN")
                            .font(.system(
                                size: 24,weight: .semibold
                            ))
                            .padding(.bottom,8)
                        Spacer()
                            .frame(width:ScreenWidth / 4,height: 5)
                            .background(.red)
                            .cornerRadius(12)
                        
                        Spacer().frame(height: 80)
                        
                        TextFieldCustom(label: "Số điện thoại", placeholder: "", text: $username, icon: "phone")
                            .keyboardType(.numberPad)
                        Spacer().frame(height: 20)
                        
                        Button {
                            
                        } label: {
                            Text("Tiếp tục")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity,maxHeight: 50)
                                .background(Gradient(colors: [
                                    Color.red,
                                    Color.pink
                                ]))
                                .cornerRadius(8)
    //                            .buttonStyle(Op)
                        }
                    } .padding(.horizontal, 20)
                   
                        
                    Spacer()
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
    //            .background(.red)
            }
        }
        
        .navigationBarHidden(true)
    }
}

#Preview {
    TypePhone(sdt: "1232132")
}
