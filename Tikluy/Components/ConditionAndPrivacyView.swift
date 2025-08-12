import SwiftUI
import Foundation

func getCurrentDateString(format: String = "dd/MM/yyyy") -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = Locale(identifier: "vi_VN") // để hiển thị theo ngôn ngữ Việt
    return formatter.string(from: date)
}

// Ví dụ dùng:
let today = getCurrentDateString() // "12/08/2025"

struct ConditionAndPrivacyView: View {
    @Binding var isChecked: Bool
    @State var isPresent: Bool = false


    var body: some View {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(isChecked ? .red : .gray)
                    .onTapGesture {
                        isChecked.toggle()
                    }
                    
                HStack {
                    (
                        Text("Tôi đã đọc, hiểu và đồng ý với ") +
                        Text("quy định về sử dụng sản phẩm & dịch vụ").underline()
                            .foregroundStyle(.red)
                             +
                        Text(" của TIKLUY.")
                    )
                    .font(.system(size: 14))
                    .onTapGesture {
                        isPresent.toggle()
                    }
                }
                
            }
            .sheet(isPresented: $isPresent, content: {
                ScrollView (showsIndicators:false) {
                    VStack(alignment:.leading){
                        Text("ĐIỀU KHOẢN GIAO DỊCH").font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text("A. CÁC ĐIỀU KIỆN VÀ ĐIỀU KHOẢN GIAO DỊCH ĐIỆN TỬ TẠI TIKLUY").font(.system(size: 14, weight: .bold))
                        Text("Cập nhật lần cuối ngày: \(today)")
                            .font(.system(size: 14, weight: .bold))
                        
                        Text("I. ĐỊNH NGHĨA VÀ GIẢI THÍCH TỪ NGỮ")
                            .font(.system(size: 14, weight: .semibold))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                        Text("1. Website/Ứng dụng TIKLUY: Là website và ứng dụng do Công ty cổ phần Đầu tư VNFITE (VNFITE Capital) phát triển, giúp cho Khách hàng là Nhà đầu tư cá nhân có thể lựa chọn (i) Tích lũy với số vốn nhỏ; (ii) Đầu tư chứng chỉ quỹ; (iii) Mua sản phẩm bảo hiểm, mua thẻ cào điện thoại, thẻ game và các sản phẩm/dịch vụ bổ sung khác.")
                            .font(.system(size: 14))
                        Spacer()
                       
                    }
                    .padding(.all, 20)
                }})
            }}
#Preview {
    ConditionAndPrivacyView(isChecked: .constant(false))

}
