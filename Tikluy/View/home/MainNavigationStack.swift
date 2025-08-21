//
//  MainNavigationStack.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 18/8/25.
//

import SwiftUI

struct MainNavigationStack: View {
    init() {
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.95)
           UITabBar.appearance().standardAppearance = appearance
           UITabBar.appearance().scrollEdgeAppearance = appearance
       }
    var body: some View {
        NavigationStack{
                TabView{
                    Home()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Trang chủ")
                        }
                    Home()
                        .tabItem {
                            Image(systemName: "person.2.fill")
                            Text("Đại lý")
                        }
                    Home()
                        .tabItem {
                            Image(systemName: "bell.fill")
                            Text("Thông báo")
                        }
                    Home()
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                            Text("Mở rộng")
                        }
                }
//                .frame(width:.infinity,height: 80)
                .tabViewStyle(.automatic)
                .accentColor(.red)
//                .cornerRadius(10)
            
            
        }
        .navigationBarHidden(true)
        .toolbar(.hidden)
    }
}

#Preview {
    MainNavigationStack()
}
