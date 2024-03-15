import Foundation
import SwiftUI

class FollowingModuleViewModel: ObservableObject {
    @Binding private var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        self._path = path
    }

    // MARK: - Intents

    func viewDidSelectBack() {
        path = .init()
    }
}
