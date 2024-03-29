import SwiftUI

struct ActionWithHaptics: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .simultaneousGesture(TapGesture().onEnded {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                action()
            })
    }
}
