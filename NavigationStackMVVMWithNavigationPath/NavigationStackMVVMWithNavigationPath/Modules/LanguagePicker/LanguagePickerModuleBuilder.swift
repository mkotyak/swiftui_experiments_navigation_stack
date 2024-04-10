import SwiftUI

struct LanguagePickerModuleBuilder {
    func view(delegate: LanguagePickerModuleDelegate) -> LanguagePickerModuleView {
        LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue: LanguageModuleViewModel(
                delegate: delegate
            ))
        )
    }
}
