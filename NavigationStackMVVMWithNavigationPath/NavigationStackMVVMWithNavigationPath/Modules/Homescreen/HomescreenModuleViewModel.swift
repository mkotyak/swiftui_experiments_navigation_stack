import Foundation
import SwiftUI

final class HomescreenModuleViewModel: ObservableObject {
    @Published var path: NavigationPath = .init() {
        didSet {
            debugPrint("NavigationPath Changed")
        }
    }

    init() {
        subscribeOnDeeplinkOpening()
    }

    deinit {
        unsubscribeFromDeeplinkOpening()
    }

    // MARK: - Intents

    func viewDidSelect(_ gameMode: GameMode) {
        debugPrint("HomescreenView did select gameMode: \(gameMode)")
    }

    func viewDidSelectSettings() {
        debugPrint("HomescreenView did select settings")
    }

    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}

// MARK: - Deeplinking

extension HomescreenModuleViewModel {
    private func subscribeOnDeeplinkOpening() {
        NotificationCenter.default.addObserver(
            forName: .onDeeplinkOpening,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else {
                return
            }

            var interimPath: NavigationPath = .init()

            interimPath.append(
                HomescreenModuleNavigationItem.gameSetup(.three)
            )
            interimPath.append(
                GameSetupModuleNavigationItem.game(
                    gameSource: .pack(
                        .init(title: "Deeplink", cards: [])
                    )
                )
            )

            self.path = interimPath
        }
    }

    private func unsubscribeFromDeeplinkOpening() {
        NotificationCenter.default.removeObserver(self)
    }
}
