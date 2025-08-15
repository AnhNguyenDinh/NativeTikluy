//
//  ComponentTestView.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 15/8/25.
//

import SwiftUI

struct ComponentTestView: View {
    @State private var date: Date = Date()
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Hello, World!")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Hello, World!")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }
        .accentColor(.green)
    }
}

#Preview {
    ComponentTestView()
}

struct HomeView: View {
    var body: some View {
        Text("Hello, World!")
           
    }
}
