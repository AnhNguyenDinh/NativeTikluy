//
//  ComponentTestView.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 15/8/25.
//

import SwiftUI

struct ComponentTestView: View {
    @State var date: Date = Date()
    var body: some View {
        TabView{
            HomeView(color: .constant(.red))
                .tabItem {
                    Image(systemName: "phone")
                    Text("Home")
                }
            HomeView(color: .constant(.blue))
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            HomeView(color: .constant(.green))
                .tabItem {
                    Image(systemName: "lock")
                    Text("Home")
                }
        }
//        .frame(width: 300, height: 400)
        .tabViewStyle(.automatic)
        .accentColor(.red)
    }
}

#Preview {
    ComponentTestView()
}

struct HomeView: View {
    @Binding  var color: Color
    var body: some View {
        ZStack{
            
            color.ignoresSafeArea(edges:.top)
                .onAppear {
                    print("onAppear 1")
                }
            Text("Hello, World!")
                .onAppear {
                    print("onAppear 2")
                }
        }
        
    }
}
