import Foundation
import SwiftUI

final class SettingsModuleBuilder {
    func view() -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: SettingsModuleViewModel()),
            languagePickerModuleBuilder: .init()
        )
    }
}
