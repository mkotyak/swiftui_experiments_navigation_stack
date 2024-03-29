import Foundation

final class GameSetupModuleViewModel: ObservableObject {
    @Published var model: GameSetupModuleModel
    
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
        model.switchSelectionState(for: pack)
    }
    
    func viewDidSelectPlay() {
        debugPrint("GameSetupModuleView did select play")
    }
}

// MARK: - GameModuleDelegate

extension GameSetupModuleViewModel: GameModuleDelegate {
    func gameModuleDidComplete() {
        debugPrint("GameSetupModuleViewModel - Game module did complete")
    }
}
