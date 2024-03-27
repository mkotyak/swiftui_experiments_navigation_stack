import Foundation
import SwiftUI

struct HomescreenModuleBuilder {
    func view() -> HomescreenModuleView {
        .init(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            navigationController: .init(
                settingsModuleBuilder: .init(),
                languagePickerModuleBuilder: .init(),
                gameSetupModuleBuilder: .init()
            )
        )
    }
}
