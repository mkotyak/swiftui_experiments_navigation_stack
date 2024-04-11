import SwiftUI
import Swinject

struct PackDetailsModuleBuilder: ModuleBuilderProtocol {
    let assembler: Assembler

    var assembly: Assembly? {
        PackDetailsModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

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
