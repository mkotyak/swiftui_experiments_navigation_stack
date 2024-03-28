import Foundation
import SwiftUI

final class GameModuleViewModel: ObservableObject {
    @Binding private var path: [NavigationItem]
    private let gameSource: GameSource
    private weak var delegate: GameModuleDelegate?
    
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
        gameSource: GameSource,
        delegate: GameModuleDelegate
    ) {
        debugPrint("🚘 GameModuleViewModel - INIT")
        self._path = path
        self.gameSource = gameSource
        self.delegate = delegate
    }
    
    deinit {
        debugPrint("🚘 GameModuleViewModel - DEINIT")
    }
    
    // MARK: - Intents
    
    func viewDidSelectLeave() {
        /// First approach - won't work for deeplink
        delegate?.gameModuleDidComplete()
        
        /// Second approach
//        NotificationCenter.default.post(
//            name: .onGameComplete,
//            object: nil
//        )
        
        path.removeLast()
    }
    
    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
