import Foundation

final class GameSetupModuleViewModel: ObservableObject {
    @Published var model: GameSetupModuleModel
    @Published var sheetType: GameSetupModuleSheetType? = nil
    @Published var isNavigationItemAvailable: Bool = false
    
    var navigationItem: GameSetupModuleNavigationItem? {
        didSet {
            isNavigationItemAvailable = navigationItem != nil
        }
    }
    
    var packs: [Pack] {
        model.packs
    }
    
    var selectedPacks: [Pack] {
        model.packs.filter { $0.isSelected }
    }
    
    var title: String {
        model.gameMode.title
    }
    
    init(model: GameSetupModuleModel) {
        self.model = model
    }
    
    // MARK: - Intents
    
    func viewDidSelect(pack: Pack) {
        sheetType = .packDetails(pack: pack)
    }
    
    func viewDidSelectPlay() {
        debugPrint("GameSetupModuleView did select play")
    }
    
    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}

// MARK: - GameModuleDelegate

extension GameSetupModuleViewModel: GameModuleDelegate {
    func gameModuleDidComplete() {
        debugPrint("GameSetupModuleViewModel - Game module did complete")
        navigationItem = nil
    }
}

// MARK: - PackDetailsModuleDelegate

extension GameSetupModuleViewModel: PackDetailsModuleDelegate {
    func packDetailsModuleDidSelectStartGame(with pack: Pack) {
        sheetType = nil
        navigationItem = .game(
            gameSource: .config(
                .init(packs: [pack])
            )
        )
    }
}
