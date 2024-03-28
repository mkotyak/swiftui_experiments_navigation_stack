import Foundation
import SwiftUI

final class GameModuleViewModel: ObservableObject {
    @Binding private var path: [NavigationItem]
    private let gameSource: GameSource
    
    var description: String {
        switch gameSource {
        case .config(let config):
            "Game from Config for \(config.pack.title)"
        case .pack(let pack):
            "Game for \(pack.title)"
        }
    }
    
    init(
        path: Binding<[NavigationItem]>,
        gameSource: GameSource
    ) {
        debugPrint("🚘 GameModuleViewModel - INIT")
        self._path = path
        self.gameSource = gameSource
    }
    
    deinit {
        debugPrint("🚘 GameModuleViewModel - DEINIT")
    }
    
    // MARK: - Intents
    
    func viewDidSelectLeave() {
        NotificationCenter.default.post(
            name: .onGameComplete,
            object: nil
        )
        
        path.removeLast()
    }
    
    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
