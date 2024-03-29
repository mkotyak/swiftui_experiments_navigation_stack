import Foundation
import SwiftUI

struct SettingsModuleBuilder {
    init() {
        debugPrint("🚘 SettingsModuleBuilder - INIT")
    }

    func view() -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: SettingsModuleViewModel()),
            languagePickerModuleBuilder: .init()
        )
    }
}
