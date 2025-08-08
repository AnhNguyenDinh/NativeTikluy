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
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
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
                            TextField("Số điện thoại", text: $username)
                                .padding(.vertical,0)
                                .onChange(of: username) { oldValue, newValue in
                                    print("\(oldValue)- \(newValue)")
                                }
                            
                            Rectangle() // Đây là viền dưới
                                .fill(Color.gray)
                                .frame(height: 1)
                            Spacer().frame(height:40)
                            SecureField("Mật khẩu",text: $password)
                            Spacer().frame(height:20)
                            HStack{
                                Spacer()
                                Button {
                                    dismiss()
                                } label: {
                                    Text("Quên mật khẩu?").frame( maxWidth:.infinity,alignment: .trailing )
                                        .foregroundColor(.black)
                                        .underline(true, color:.black)
                                }

                                
                            }
                               
                            
                            
                            
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
            .onAppear {
                username = "0357628024"
                password = "Admin123@"
            }
        }
        .navigationBarHidden(true)
        
        
        
    }
    
}



#Preview {
    Login()
}
