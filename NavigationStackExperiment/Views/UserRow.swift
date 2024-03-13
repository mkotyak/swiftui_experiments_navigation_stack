import SwiftUI

struct UserRow: View {
    let user: User

    var body: some View {
        ZStack {
            backgroundView
            contentView
        }
        .frame(height: 100)
    }

    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(.white)
            .shadow(radius: 5)
    }

    private var contentView: some View {
        HStack(spacing: 20) {
            Image(systemName: "person")
                .font(.system(size: 30))
                .frame(width: 60, height: 60)
                .foregroundStyle(.purple)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.purple, lineWidth: 2)
                }

            VStack(alignment: .leading) {
                Text(user.displayName)
                    .bold()

                Text(user.userName)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}
