import SwiftUI

extension View {
    func withHapticAction(_ action: @escaping () -> Void) -> some View {
        modifier(ActionWithHaptics(action: action))
    }
}
