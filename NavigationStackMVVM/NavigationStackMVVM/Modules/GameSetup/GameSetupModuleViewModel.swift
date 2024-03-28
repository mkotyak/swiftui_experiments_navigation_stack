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
        subscribeOnGameComplete()
    }

    deinit {
        debugPrint("🚘 GameSetupModuleViewModel - DEINIT")
        unsubscribeFromGameComplete()
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
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }

    // MARK: - Private

    private func subscribeOnGameComplete() {
        NotificationCenter.default.addObserver(
            forName: .onGameComplete,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else {
                return
            }

            // Call some analytics events
            debugPrint("🚘 GameSetupModuleViewModel - On Game Complete")
        }
    }

    private func unsubscribeFromGameComplete() {
        NotificationCenter.default.removeObserver(self)
    }
}
