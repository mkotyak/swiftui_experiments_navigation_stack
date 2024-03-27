import Foundation
import SwiftUI

class GameSetupModuleBuilder {
    init() {
        debugPrint("🚘 GameSetupModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 GameSetupModuleBuilder - DEINIT")
    }
    
    func view(
        path: Binding<[NavigationItem]>,
        gameMode: GameMode
    ) -> GameSetupModuleView {
        debugPrint("🚘 GameSetupModuleBuilder - module builded")
        
        return GameSetupModuleView(
            viewModel: StateObject(wrappedValue: GameSetupModuleViewModel(
                path: path,
                model: GameSetupModuleModel(gameMode: gameMode)
            ))
        )
    }
}
