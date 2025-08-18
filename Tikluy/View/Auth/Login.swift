import SwiftUI

let widthLogo = ScreenWidth * 0.5
let heightLogo = widthLogo / 4

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLogin: Bool = true
    @State private var navigateRegister : Bool = false
    @State private var isLoginSuccess : Bool = false
    @State private var isShowWarning : Bool = false
    @State private var warningText : String = ""
    @State private var isShowPassWord : Bool = false
    @State private var isSecure : Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let safeAreaTop = geometry.safeAreaInsets.top
                ZStack {
                    ScrollView {
                        Spacer().frame(height: ScreenWidth * 0.2)
                        headerLogo
                        
                        Spacer().frame(height: isLogin ? 100 : 40)
                        
                        ZStack {
                            if isLogin { smallLogo }
                            formSection
                        }
                        .padding(.top, safeAreaTop)
                    }
                    ModalFullView(isPresented: $isShowWarning,description: warningText)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("bg_login")
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                )
                .ignoresSafeArea()
                NavigationLink("",destination: ProcedureRegister(), isActive: $navigateRegister).hidden()
                
            }
        }
        .navigationBarHidden(true)
    }
    
}

// MARK: - Subviews
private extension Login {
    var headerLogo: some View {
        Image("logo_full")
            .resizable()
            .frame(width: widthLogo, height: heightLogo)
            .aspectRatio(contentMode: .fit)
    }
    
    var smallLogo: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZbMPqYroYd4Hmfi_qj2Sxb4v7YBZeL6U07w&s")) { image in
                image.resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .background(.white)
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.red, lineWidth: 2)
                        
                    )
                    .position(x: ScreenWidth / 2, y: 0)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
                    .background(.white)
                    .cornerRadius(50)
                    .position(x: ScreenWidth / 2, y: 0)
                
            }
            Button {
                isLogin.toggle()
            } label: {
                
                Image(systemName: "chevron.left")
                    .frame(width: 40, height: 40)
                    .font(.system(size: 18, weight: .semibold))
                    .background(.white)
                    .cornerRadius(20)
                    .foregroundStyle(.red)
                
            }
            .position(x: ScreenWidth / 2 - 80, y: -0)
            
            
        }
        .zIndex(1)
        
    }
    
    var formSection: some View {
        VStack {
            if isLogin {
                Text("NGUYEN VAN AN")
                    .font(.system(size: 20, weight: .bold))
                Spacer().frame(height: 20)
                Spacer().frame(width: 100, height: 2).background(Color.black)
            } else {
                TextFieldCustom(label: "Số điện thoại", placeholder: "", text: $username, icon: "phone")
                    .keyboardType(.numberPad)
                Spacer().frame(height: 20)
            }
            
            TextFieldCustom(label: "Mật khẩu", placeholder: "", text: $password, icon: "lock", isSecure: isShowPassWord){
                Button {
                    isShowPassWord.toggle()
                } label:{
                    Image(systemName: isShowPassWord ?   "eye.fill" : "eye.slash.fill" )
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.black)
                }
            }
            Spacer().frame(height: 20)
            
            forgotPasswordButton
            Spacer().frame(height: 40)
            loginButton
            Spacer().frame(height: 20)
            
            if isLogin {
                faceIdButton
            } else {
                registerPrompt
            }
        }
        .padding(.all, 20)
        .padding(.top, isLogin ? 40 : 20)
        .background(.ultraThinMaterial)
        //        .background(Color.white.opacity(0.2))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
    var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button {
                //                navigateRegister.toggle()
                // Forgot password action
            } label: {
                Text("Quên mật khẩu?")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.black)
                    .underline()
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
    
    var loginButton: some View {
        
        Button {
            if username == "0357628024" || password == "123456" {
                print("Đăng nhập \(username) \(password)")
            }
            else{
                warningText = "Sai tài khoản hoặc mật khẩu"
                isShowWarning.toggle()
            }
        } label: {
            Text("ĐĂNG NHẬP")
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background( password.isEmpty ? Color.gray : Color.red)
                .cornerRadius(4)
        }
        .disabled(password.isEmpty)
    }
    
    var faceIdButton: some View {
        Button {
            // Face ID action
        } label: {
            Image(systemName: "faceid")
                .frame(width: 60, height: 60)
                .font(.system(size: 32, weight: .semibold))
                .background(.red)
                .cornerRadius(12)
                .foregroundStyle(.white)
            
        }
    }
    
    var registerPrompt: some View {
        HStack(spacing: 4) {
            Text("Bạn chưa có tài khoản?")
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(.black)
            Button {
                print("Dang ký")
                navigateRegister.toggle()
            } label: {
                Text("Đăng ký tài khoản")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    Login()
}
