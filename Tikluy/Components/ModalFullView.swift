//
//  SheetView.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 12/8/25.
//

import SwiftUI

struct ModalFullView: View {
    @Binding var isPresented: Bool
    var description: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            if(isPresented){
                VStack {
                    VStack{
                        Text("THÔNG BÁO")
                            .font(.system(size: 18, weight: .bold))
                        Spacer().frame(height: 10)
                        Text("\(description)")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                        Spacer().frame(height:20)
                        Button(action: {
                            isPresented.toggle()
                        }, label: {
                           Text("XÁC NHẬN")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth:.infinity)
                                .padding(.all,12)
                                .background(Color.red)
                                .cornerRadius(8)
                                
                        })
                        
                    }
                    .frame(maxWidth: ScreenWidth * 0.6 )
                    .padding(.all,20)
                    .background(Color.white)
                    .cornerRadius(12)
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
    }
}

#Preview {
    ModalFullView(isPresented: .constant(true))
}
