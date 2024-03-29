import Foundation
import SwiftUI

struct HomescreenModuleBuilder {
    func view() -> HomescreenModuleView {
        HomescreenModuleView(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            settingsModuleBuilder: .init(),
            gameSetupModuleBuilder: .init()
        )
    }
}
