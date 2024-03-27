import Foundation
import SwiftUI

final class GameSetupModuleViewModel: ObservableObject {
    @Binding private var path: [NavigationItem]
    @Published private var model: GameSetupModuleModel

    var packs: [Pack] {
        model.packs
    }

    var title: String {
        model.gameMode.title
    }

    init(
        path: Binding<[NavigationItem]>,
        model: GameSetupModuleModel
    ) {
        debugPrint("🚘 GameSetupModuleViewModel - INIT")
        self._path = path
        self.model = model
    }

    deinit {
        debugPrint("🚘 GameSetupModuleViewModel - DEINIT")
    }

    // MARK: Intents

    func viewDidSelect(pack: Pack) {
        path.append(.game(
            .config(.init(pack: pack))
        ))
    }

    func viewDidSelectLeave() {
        path.removeLast()
    }

    func viewDidSelectDeeplink() {
        // First Approach - When GameSetup manage deeplinking by itself
//        path = [
//            .gameSetup(.three),
//            .game(.pack(.init(
//                title: "Deeplink Pack",
//                cards: []
//            )))
//        ]

        // Second Approach - When GameSetup posts notification aboud deeplinking to Homescreen manage it by itself
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
