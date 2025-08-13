import SwiftUI

struct HeaderLogoFull<RightContent: View>: View {
    @Environment(\.dismiss) var dismiss
    var rightView: RightContent?

    init(@ViewBuilder rightView: () -> RightContent? = { EmptyView() }) {
        self.rightView = rightView()
    }

    var body: some View {
        ZStack {
            // Logo ở giữa
            Image("logo_full")
                .resizable()
                .frame(width: widthLogo, height: heightLogo)
                .position(x: ScreenWidth / 2, y: heightLogo / 2)

            // Nút back và view phải
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.red)
                        .frame(width: 24, height: 24)
//                        .font(.system(  ))
                }

                Spacer()

                if let rightView = rightView {
                    rightView
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: heightLogo)
//        .background(.blue)
    }
}

#Preview {
            HeaderLogoFull {
            Image(systemName: "bell")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.blue)
        }

}
