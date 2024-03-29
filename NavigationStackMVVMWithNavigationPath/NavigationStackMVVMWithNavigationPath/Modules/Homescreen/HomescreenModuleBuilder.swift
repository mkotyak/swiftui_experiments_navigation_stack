import Foundation
import SwiftUI

struct HomescreenModuleBuilder {
    init() {
        debugPrint("🚘 HomescreenModuleBuilder - INIT")
    }

    func view() -> HomescreenModuleView {
        HomescreenModuleView(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            settingsModuleBuilder: .init()
        )
    }
}
