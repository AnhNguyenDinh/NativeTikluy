//
//  MainNavigationStack.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 18/8/25.
//

import SwiftUI

struct MainNavigationStack: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
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
//        .frame(width: 300, height: 400)
        .tabViewStyle(.automatic)
        .accentColor(.red)
    }
}

#Preview {
    MainNavigationStack()
}
