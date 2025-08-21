//
//  Home.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 18/8/25.
//

import SwiftUI
enum TransactionType  {
    case recharge
    case withdraw
    case properties
    
}
struct transactionFutureModel : Identifiable, Hashable {
    var id :String = UUID().uuidString
    var label :String
    var type :TransactionType
    var image: String
}

struct productModel : Identifiable {
    var id :String = UUID().uuidString
    var label :String
    var image: String
    var description :String
    
}

let futureList : [transactionFutureModel] = [
    transactionFutureModel(label: "Nạp tiền", type:TransactionType.recharge, image: "square.and.arrow.up"),
    transactionFutureModel(label: "Tài sản", type:TransactionType.properties, image: "dollarsign.gauge.chart.lefthalf.righthalf"),
    transactionFutureModel(label: "Rút tiền", type:TransactionType.withdraw, image: "square.and.arrow.down")
]

let productList : [productModel] = [
    productModel(label: "Đầu tư lộc vàng", image: "square.and.arrow.up", description: "Đa dạng sản phẩm với lãi suất hấp dẫn từ 10% đến 18%/ năm với kỳ hạn 1, 2, 3, 4, 9, 12 tháng"),
    productModel(label: "Đầu tư lộc vàng", image: "square.and.arrow.up", description: "Đa dạng sản phẩm với lãi suất hấp dẫn từ 10% đến 18%/ năm với kỳ hạn 1, 2, 3, 4, 9, 12 tháng"),
    productModel(label: "Đầu tư lộc vàng", image: "square.and.arrow.up", description: "Đa dạng sản phẩm với lãi suất hấp dẫn từ 10% đến 18%/ năm với kỳ hạn 1, 2, 3, 4, 9, 12 tháng"),
    productModel(label: "Đầu tư lộc vàng", image: "square.and.arrow.up", description: "Đa dạng sản phẩm với lãi suất hấp dẫn từ 10% đến 18%/ năm với kỳ hạn 1, 2, 3, 4, 9, 12 tháng"),
]



struct Home: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView (showsIndicators:false){
                    inforHeader
                    Spacer().frame(height: ScreenHeight * 0.25)
                    transactionFuture
                    Spacer().frame(height:20)
                    products
                    Spacer().frame(height:20)
                }
                .padding(.horizontal, 20)
                
                
            }
            .padding(.top,geometry.safeAreaInsets.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("bg_login")
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
            )
            .ignoresSafeArea(.all)
        }
        
        
    }
    
}

private extension Home {
    
    
    var inforHeader: some View {
        HStack{
            Image("logo_small")
                .resizable()
                .frame(width: 64, height: 64)
                .aspectRatio(contentMode: .fit)
                .background(Color.white)
                .cornerRadius(32)
            HStack (){
                VStack(alignment:.leading){
                    Text("VNC000000000")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13, weight: .medium))
                    Text("1.145.484.000 VNĐ")
                        .foregroundStyle(.red)
                        .font(.system(size: 16, weight: .semibold))
                }
                //                .frame(maxWidth:.infinity)
                //                .background(Color.white)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .frame(width: 50, height: 50)
                    //                        .background(.red)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1),
                            alignment: .leading
                        )
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 64.0)
            .padding(.leading, 16)
            .padding(.trailing, 8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
    
    var transactionFuture : some View {
        HStack(alignment: .bottom) {
            ForEach(Array(futureList.enumerated()), id: \.element.id) { index, element in
                if (index % 2 == 0){
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: element.image)
                                .foregroundStyle(.white)
                            Text(element.label)
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(.horizontal,20)
                        .padding(.vertical,12)
                        .background(.red)
                        .cornerRadius(100)
                    }
                    
                }
                else{
                    Spacer()
                    VStack(spacing:4){
                        Image(systemName: element.image)
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .medium))
                        Text(element.label)
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .frame(width: 80, height:80)
                    .background(
                        .red
                    )
                    .cornerRadius(100)
                    Spacer()
                }
                
            }
        }
        //        .background(Color.red)
    }
    //productList
    var products: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack  {
                ForEach(productList) {  element in
                    HStack (spacing:16) {
                        
                        Image(systemName: element.image)
                            .foregroundStyle(.white)
                            .font(.system(size: 50, weight: .medium))
                        VStack(spacing:8){
                            Text(element.label)
                                .foregroundStyle(.white)
                                .font(.system(size: 14, weight: .semibold))
                            Text(element.description)
                                .foregroundStyle(.white)
                                .font(.system(size: 12, weight: .medium))
                            
                    
                            VStack(alignment: .trailing) {
                                HStack{
                                    Text("Đầu tư")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.white)
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12, weight: .medium))
                                }
                                .padding(.trailing, 20)
                                
                            }
                            .frame(maxWidth:.infinity, alignment:.trailing)
                            
                        }
                    }
                    .padding(16)
                    .frame(width:ScreenWidth * 0.8, height: 120)
                    .background(
                        .red
//                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(8)
                }
            }
        }
        
        
    }
    
//    var extensitons: some View {
//        
//    }
}
#Preview {
    Home()
}

