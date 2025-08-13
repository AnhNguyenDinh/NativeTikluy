//
//  ProcedureRegister.swift
//  Tikluy
//
//  Created by Đình Anh Nguyễn  on 10/8/25.
//

import SwiftUI
struct StepRegister: Identifiable {
    var id: Int
    var step: String
    var description: String
    var showNextStep: Bool
}
let stepList: [StepRegister] = [
    StepRegister(id: 1, step: "1", description: "Nhập số điện thoại", showNextStep: true),
    StepRegister(id: 2, step: "2", description: "Xác thực số điện thoại", showNextStep: true),
    StepRegister(id: 3, step: "3", description: "Nhập OTP xác thực", showNextStep: true),
    StepRegister(id: 4, step: "4", description: "Đăng ký thành công", showNextStep: false)
]

struct ProcedureRegister: View {
    @State private var isChecked :Bool = false
    let warningText : String = "Vui lòng đọc kỹ và đồng ý với Quy định về sử dụng sản phẩm & dịch vụ của TIKLUY trước khi tiếp tục"
    @State private var isShowWarning :Bool = false
    @State private var isNextScreen : Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    HeaderLogoFull()
            //        Image("logo_full")
            //            .resizable()
            //            .frame(width: widthLogo, height: heightLogo)
                    Spacer().frame(height: 40)
                    ScrollView () {
                        VStack(alignment:.leading, spacing: 0){
                            Text("QUY TRÌNH MỞ TÀI KHOẢN").frame(maxWidth:.infinity, alignment:.leading)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.red)
                            Spacer().frame(height:20)
                            
                            
                            ForEach(stepList, id: \.id) { step in
                                renderStep(step: step.step, decription: step.description, isShowNextStep: step.showNextStep)
                            }
                            
                            Spacer().frame(height:40)
                            Text("LƯU Ý")
                                .font(.system(size: 16, weight: .bold)).foregroundStyle(.red)
                            Spacer().frame(height:20)
                            Text("Người dùng cần chuẩn bị một số thông tin và giấy tờ sau đây.")
                                .font(.system(size: 16))
                            Spacer()
                            Text(" 1.  Chứng minh thư/ Căn cước công dân.")
                                .font(.system(size: 16))
                            Text(" 2.  Số điện thoại ( Chính chủ ).")
                                .font(.system(size: 16))
                            Spacer()
                            Text("Chúng tôi cần biết để xác minh thông tin cũng như bảo mật thông tin cho người sử dụng.")
                                .font(.system(size: 16))
                            Spacer().frame(height:20)
                            Text("ĐIỀU KIỆN & ĐIỀU KHOẢN")
                                .font(.system(size: 20, weight: .bold)).foregroundStyle(.red)
                            Spacer().frame(height:20)
                            ConditionAndPrivacyView(isChecked: $isChecked)
                            Spacer().frame(height:20)
                            Button {
                                guard isChecked else {
                                     isShowWarning.toggle()
                                     return
                                }
                                isNextScreen = true

                            } label: {
                                Text("TIẾP TỤC")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.vertical, 16)
                                    .background(isChecked ? .red : .gray)
                                    .cornerRadius(4)
                                   
                            }
            //
                        }
                    }
                    .padding(.horizontal, 20)
                }
                NavigationLink("",destination: TypePhone(sdt:"0357628024"), isActive: $isNextScreen).hidden()
                ModalFullView(isPresented: $isShowWarning,description: warningText)
            }
            
        }
        .navigationBarHidden(true)
            
        
       
    }
}


    struct renderStep : View {
        
        var step : String
        var decription : String
        var isShowNextStep : Bool = true
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                HStack{
                    Text(step)
                        .foregroundStyle(.red)
                        .frame(width: 30, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.red, lineWidth: 2)
                            
                        )
                        .padding(1)
//                        .background(Color.blue)
//                        .multilineTextAlignment(.leading)
                    Text(decription)
                }
                .frame(maxWidth:.infinity,alignment: .topLeading)
                if isShowNextStep {
                    Rectangle().frame(width: 2, height: 30).foregroundStyle(.red).padding(.leading, 15)
                }
            }
            .frame(maxWidth:.infinity)
        }
        
    }


#Preview {
    ProcedureRegister()
}
