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
        self._path = path
        self.gameSource = gameSource
    }
    
    // MARK: - Intents
    
    func viewDidSelectLeave() {
        path.removeLast()
    }
    
    func viewDidSelectDeeplink() {
        // First Approach - When Game manage deeplinking by itself
//        path = [
//            .gameSetup(.three),
//            .game(.pack(.init(
//                title: "Deeplink Pack",
//                cards: []
//            )))
//        ]

        // Second Approach - When Game posts notification aboud deeplinking to Homescreen manage it by itself
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
