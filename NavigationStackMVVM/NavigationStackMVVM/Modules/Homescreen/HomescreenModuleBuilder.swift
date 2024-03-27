import Foundation
import SwiftUI

final class HomescreenModuleBuilder {
    func view() -> HomescreenModuleView {
        .init(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel()),
            navigationController: .init(
                settingsModuleBuilder: .init()
            )
        )
    }
}
