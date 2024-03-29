import Foundation
import SwiftUI

final class HomescreenModuleViewModel: ObservableObject {
    @Published var path: NavigationPath = .init() {
        didSet {
            debugPrint("🚘 PATH - Count: \(path.count)")
        }
    }

    // MARK: - Intents

    func viewDidSelect(_ gameMode: GameMode) {
        debugPrint("HomescreenView did select gameMode: \(gameMode)")
    }

    func viewDidSelectSettings() {
        debugPrint("HomescreenView did select settings")
    }
}
