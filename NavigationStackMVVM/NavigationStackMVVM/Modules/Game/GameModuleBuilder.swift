import Foundation
import SwiftUI

class GameModuleBuilder {
    init() {
        debugPrint("🚘 GameModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 GameModuleBuilder - DEINIT")
    }
    
    func view(
        path: Binding<[NavigationItem]>,
        gameSource: GameSource
    ) -> GameModuleView {
        debugPrint("🚘 GameModuleBuilder - module builded")
        
        return GameModuleView(viewModel: StateObject(wrappedValue: GameModuleViewModel(
            path: path,
            gameSource: gameSource
        )))
    }
}
