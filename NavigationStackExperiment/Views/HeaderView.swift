import SwiftUI

struct HeaderView: View {
    let displayName: String

    var body: some View {
        HStack {
            profileImage
            userInfoView
            Spacer()
        }
        .padding(.horizontal)
    }

    private var profileImage: some View {
        Image(systemName: "person")
            .foregroundColor(.purple)
            .frame(width: 80, height: 80)
            .font(.system(size: 35))
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.purple, lineWidth: 2)
            }
    }

    private var userInfoView: some View {
        VStack(alignment: .leading) {
            Text(displayName)
                .bold()
            Text("Joined November 1st")
                .foregroundStyle(.gray)
        }
        .padding(.leading, 5)
    }
}
