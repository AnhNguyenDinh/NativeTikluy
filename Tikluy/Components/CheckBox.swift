import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool

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
                        print("Show Sheet len")
                    }
                }

            }
        
    }
}

