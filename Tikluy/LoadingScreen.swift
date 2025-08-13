//
//  ContentView.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 7/8/25.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var isNavigateToLogin: Bool = false
    var body: some View {
        NavigationView{
            ZStack {
                ProgressView()
                    .scaleEffect(2)
                    .tint(.red)
                    .accentColor(.blue)
                NavigationLink("",destination:Login() , isActive: $isNavigateToLogin).hidden()
            }
            .frame(maxWidth: .infinity,  maxHeight: .infinity )
            .background(
                Image("bg_login")
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
            )
            .ignoresSafeArea(.all)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isNavigateToLogin = true
            }
        }
        .onDisappear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isNavigateToLogin = true
            }
        }
    
    }
}

#Preview {
    LoadingScreen()
}
