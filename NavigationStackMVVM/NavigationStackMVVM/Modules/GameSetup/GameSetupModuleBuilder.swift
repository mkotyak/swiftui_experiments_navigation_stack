import Foundation
import SwiftUI

final class GameSetupModuleBuilder {
    func view(
        path: Binding<[NavigationItem]>,
        gameMode: GameMode
    ) -> GameSetupModuleView {
        GameSetupModuleView(
            viewModel: StateObject(wrappedValue: GameSetupModuleViewModel(
                path: path,
                model: GameSetupModuleModel(gameMode: gameMode)
            ))
        )
    }
}
