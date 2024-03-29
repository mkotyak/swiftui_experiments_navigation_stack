import SwiftUI

struct LanguagePickerModuleBuilder {
    func view() -> LanguagePickerModuleView {
        LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue: LanguageModuleViewModel())
        )
    }
}
