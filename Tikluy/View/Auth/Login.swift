//
//  Login.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 7/8/25.
//

import SwiftUI
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

let widthLogo = screenWidth * 0.5
let heightLogo =  widthLogo / 4

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLogin: Bool = true
    
    var body: some View {
        NavigationView{
            GeometryReader{geometry in
                let safeAreaTop = geometry.safeAreaInsets.top
               
                ZStack {
                    ScrollView{
                        Spacer().frame(height:screenWidth * 0.2)
                        Image("logo_full")
                            .resizable()
                            .frame(width: widthLogo, height:heightLogo)
                        
                        Spacer().frame(height:isLogin ? 100 :40)
                        ZStack {
                            if isLogin {
                                Image("logo_small")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height:100)
                                    .background(.white)
                                    .cornerRadius(50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.red, lineWidth: 2)
                                    )
                                    .position(x:screenWidth / 2,y:0)
                                    .zIndex(1)
                            }
                            VStack() {
                                if isLogin {
                                    Text("NGUYEN VAN ANH")
                                        .font(.system(size: 20, weight: .bold))
                                    Spacer().frame(height:20)
                                    Spacer().frame(width:100,height:2).background( Color.black)
                                        
                                }
                                else{
                                    TextFieldCustom(label: "Số điện thoại", placeholder: "", text: $username,icon: "phone")
                                        .onChange(of: username) { oldValue, newValue in
                                            username = newValue
                                        }
                                        .keyboardType(.numberPad)
                                }
                                Spacer().frame(height:20)
                                TextFieldCustom(label: "Mật khẩu", placeholder: "", text: $password,icon: "password", isSecure: true)
                                    .onChange(of: password) { oldValue, newValue in
                                        password = newValue
                                    }
                                Spacer().frame(height:20)
                                HStack{
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        Text("Quên mật khẩu?").frame( maxWidth:.infinity,alignment: .trailing )
                                            .foregroundColor(.black)
                                            .underline(true, color:.black)
                                            .font(.system(size: 14, weight: .semibold, design: .default))
                                    }
                                    
                                    
                                }
                                Spacer().frame(height:40)
                                HStack(){
                                    if !isLogin{
                                        Button {
                                            //                                    print("Đăng ký")
                                        } label: {
                                            Text("MỞ TÀI KHOẢN")
                                                .font(.system(size: 14, weight: .semibold, design: .default))
                                                .padding(.horizontal,16)
                                                .padding(.vertical,12)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.red)
                                                .frame(width:screenWidth * 0.4)
                                                .background(Color.white)
                                                .cornerRadius(4)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color.red, lineWidth: 1)
                                                )
    //                                            .shadow(radius: 2)
                                        }
                                        Spacer()
                                    }
                                 
                                   
                                    Button {
                                        print("Đăng nhập \(username) \(password)")
                                    } label: {
                                        Text("ĐĂNG NHẬP")
                                            .font(.system(size: 14, weight: .semibold, design: .default))
                                            .padding(.horizontal,16)
                                            .padding(.vertical,12)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .frame(width: isLogin ? .infinity :  screenWidth * 0.4 )
                                            .background(Color.red)
                                            .cornerRadius(4)
//                                            .shadow(radius: 2)
                                    }
                                }
                                
                                Spacer().frame(height:20)
                                VStack{
                                    Button {
                                        //                                    print("Đăng nhập")
                                    } label: {
                                        Image("face_id")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                    }
                                }
                            }
                            .padding(.all, 20)
                            .padding(.top, isLogin ? 40 : 20)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                        }
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
        .navigationBarHidden(true)
        .onAppear {
//                username = "123"
//                password = "123"
        }
    }
    
}



#Preview {
    Login()
}
