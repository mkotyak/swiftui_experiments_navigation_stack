import SwiftUI

struct GameSetupModuleBuilder {
    func view(gameMode: GameMode) -> GameSetupModuleView {
        GameSetupModuleView(
            viewModel: StateObject(wrappedValue: GameSetupModuleViewModel(
                model: GameSetupModuleModel(gameMode: gameMode))
            )
        )
    }
}
