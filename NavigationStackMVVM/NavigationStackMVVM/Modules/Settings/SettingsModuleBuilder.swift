import SwiftUI

struct SettingsModuleBuilder {
    func view(path: Binding<[NavigationItem]>) -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: SettingsModuleViewModel(
                path: path
            ))
        )
    }
}
