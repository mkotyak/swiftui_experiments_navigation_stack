import SwiftUI

struct GameModuleBuilder {
    func view(
        gameSource: GameSource,
        delegate: GameModuleDelegate
    ) -> GameModuleView {
        GameModuleView(
            viewModel: StateObject(wrappedValue: GameModuleViewModel(
                gameSource: gameSource,
                delegate: delegate
            ))
        )
    }
}
