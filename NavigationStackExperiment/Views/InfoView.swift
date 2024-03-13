import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label("Last Played", systemImage: "clock")
                Label("Crypto.com Arena", systemImage: "map")
            }
            .foregroundStyle(.gray)

            Spacer()
        }
        .padding(.horizontal)
    }
}
