import Foundation
import SwiftUI

struct LanguagePickerModuleBuilder {
    func view(path: Binding<[NavigationItem]>) -> LanguagePickerModuleView {
        LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue: LanguagePickerModuleViewModel(
                path: path
            ))
        )
    }
}
