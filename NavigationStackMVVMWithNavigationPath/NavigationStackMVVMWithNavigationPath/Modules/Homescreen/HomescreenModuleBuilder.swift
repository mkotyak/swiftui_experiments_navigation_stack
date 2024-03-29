import Foundation
import SwiftUI

final class HomescreenModuleBuilder {
    init() {
      debugPrint("🚘 HomescreenModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 HomescreenModuleBuilder - DEINIT")
    }
    
    func view() -> HomescreenModuleView {
        HomescreenModuleView(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            settingsModuleBuilder: .init()
        )
    }
}
