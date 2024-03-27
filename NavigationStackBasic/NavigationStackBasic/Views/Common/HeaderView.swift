import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title)
            .bold()
    }
}
