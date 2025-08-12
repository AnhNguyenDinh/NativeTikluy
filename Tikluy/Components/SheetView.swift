//
//  SheetView.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 12/8/25.
//

import SwiftUI

struct SheetView: View {
    @State var isPresented: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Button {
                isPresented.toggle()
            } label: {
                Text("Show Sheet")
            }
            if(isPresented){
                VStack {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Show Sheet")
                    }
                    Spacer()
                    Text("Show Sheet").foregroundStyle(.white)
                    Text("Show Sheet").foregroundStyle(.white)
                    Text("Show Sheet").foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.6))
                .transition(.opacity)
//                .opacity(isPresented ? 1 : 0)
//                .animation(.easeInOut(duration: 2))
                .zIndex(10)
                .animation(.easeInOut(duration: 0.5), value: isPresented)
            }
        }
        
//        .fullScreenCover(isPresented: $isPresented, onDismiss: {
//            print("dimiss")
//        },content: {
//            VStack {
//                
//                Text("Content Sheet")
//                    .transition(.move(edge: .bottom).combined(with: .opacity))
//                Button {
//                    isPresented.toggle()
//                } label: {
//                    Text("Dimiss Sheet")
//                }
//            }
//            
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.black.opacity(0.2))
//            
//        })
    }
}

#Preview {
    SheetView()
}
