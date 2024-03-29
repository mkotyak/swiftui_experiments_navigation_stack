import Foundation
import SwiftUI

struct SettingsModuleBuilder {
    func view() -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: SettingsModuleViewModel()),
            languagePickerModuleBuilder: .init()
        )
    }
}
