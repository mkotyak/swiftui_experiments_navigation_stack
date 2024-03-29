import Foundation
import SwiftUI

final class SettingsModuleBuilder {
    init() {
        debugPrint("🚘 SettingsModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 SettingsModuleBuilder - DEINIT")
    }

    func view() -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: SettingsModuleViewModel()),
            languagePickerModuleBuilder: .init()
        )
    }
}
