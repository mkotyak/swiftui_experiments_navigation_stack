import Foundation
import SwiftUI

struct GameModuleBuilder {
    func view(
        path: Binding<[NavigationItem]>,
        gameSource: GameSource
    ) -> GameModuleView {
        GameModuleView(viewModel: StateObject(wrappedValue: GameModuleViewModel(
            path: path,
            gameSource: gameSource
        )))
    }
}
