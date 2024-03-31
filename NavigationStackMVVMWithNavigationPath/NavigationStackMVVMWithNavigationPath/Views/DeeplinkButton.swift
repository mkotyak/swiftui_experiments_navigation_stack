import SwiftUI

struct DeeplinkButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "link")
                .resizable()
        }
    }
}
