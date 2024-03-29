import Foundation
import SwiftUI

final class HomescreenModuleBuilder {
    func view() -> HomescreenModuleView {
        HomescreenModuleView(
            viewModel: StateObject(wrappedValue: HomescreenModuleViewModel())
        )
    }
}
