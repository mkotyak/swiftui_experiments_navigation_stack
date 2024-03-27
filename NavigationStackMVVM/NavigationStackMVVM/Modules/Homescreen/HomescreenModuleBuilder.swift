import Foundation
import SwiftUI

class HomescreenModuleBuilder {
    init() {
        debugPrint("🚘 HomescreenModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 HomescreenModuleBuilder - DEINIT")
    }
    
    func view() -> HomescreenModuleView {
        debugPrint("🚘 HomescreenModuleBuilder - module builded")
        
        return HomescreenModuleView(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            navigationController: .init(
                settingsModuleBuilder: .init(),
                languagePickerModuleBuilder: .init(),
                gameSetupModuleBuilder: .init(),
                gameModuleBuilder: .init()
            )
        )
    }
}
