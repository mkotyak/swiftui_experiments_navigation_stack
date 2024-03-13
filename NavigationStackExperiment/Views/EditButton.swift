import SwiftUI

struct EditButton: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .circular)
                    .fill(.white)
                    .shadow(radius: 5)

                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 140, height: 32)
            }
            .buttonBorderShape(.capsule)
            .frame(width: 140, height: 48)
        }
    }
}
