import SwiftUI

struct PackDetailsModuleBuilder {
    func view(
        pack: Pack,
        delegate: PackDetailsModuleDelegate
    ) -> PackDetailsModuleView {
        PackDetailsModuleView(viewModel: StateObject(wrappedValue: PackDetailsModuleViewModel(
            model: PackDetailsModuleModel(pack: pack),
            delegate: delegate
        )))
    }
}
