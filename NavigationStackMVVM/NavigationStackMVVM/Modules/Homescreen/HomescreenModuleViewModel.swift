import Foundation

final class HomescreenModuleViewModel: ObservableObject {
    @Published var path: [NavigationItem] = []

    init() {
        debugPrint("🚘 HomescreenModuleViewModel - INIT")
        subscribeOnDeeplinkOpening()
    }

    deinit {
        debugPrint("🚘 HomescreenModuleViewModel - DEINIT")
        unsubscribeFromDeeplinkOpening()
    }

    // MARK: - Intents

    func viewDidSelect(gameMode: GameMode) {
        path.append(.gameSetup(gameMode))
    }

    func viewDidSelectSettings() {
        path.append(.settings)
    }

    func viewDidSelectDeeplink() {
        path = [
            .gameSetup(.three),
            .game(.pack(.init(
                title: "Deeplink Pack",
                cards: []
            )))
        ]
    }

    // MARK: - Deeplink navigation

    private func subscribeOnDeeplinkOpening() {
        NotificationCenter.default.addObserver(
            forName: .onDeeplinkOpening,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else {
                return
            }

            path = [
                .gameSetup(.three),
                .game(.pack(.init(
                    title: "Deeplink Pack",
                    cards: []
                )))
            ]
        }
    }

    private func unsubscribeFromDeeplinkOpening() {
        NotificationCenter.default.removeObserver(self)
    }
}
