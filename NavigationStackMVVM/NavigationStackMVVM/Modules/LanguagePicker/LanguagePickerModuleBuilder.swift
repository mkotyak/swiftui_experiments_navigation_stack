import Foundation
import SwiftUI

class LanguagePickerModuleBuilder {
    func view(path: Binding<[NavigationItem]>) -> LanguagePickerModuleView {
        LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue: LanguagePickerModuleViewModel(
                path: path
            ))
        )
    }
}
