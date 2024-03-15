import Foundation
import SwiftUI

class FollowersModuleViewModel: ObservableObject {
    @Binding private var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        self._path = path
    }

    // MARK: - Intents

    func viewDidSelectBack() {
        path = .init()
    }
}
