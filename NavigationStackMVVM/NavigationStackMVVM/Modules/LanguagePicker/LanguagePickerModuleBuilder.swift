import Foundation
import SwiftUI

final class LanguagePickerModuleBuilder {
    func view(path: Binding<[NavigationItem]>) -> LanguagePickerModuleView {
        LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue: LanguagePickerModuleViewModel(
                path: path
            ))
        )
    }
}
