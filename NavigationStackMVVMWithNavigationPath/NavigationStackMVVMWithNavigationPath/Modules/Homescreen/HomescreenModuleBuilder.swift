import SwiftUI
import Swinject

struct HomescreenModuleBuilder: ModuleBuilderProtocol {
    let assembler: Assembler

    var assembly: Assembly? {
        HomescreenModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func view() -> HomescreenModuleView {
        HomescreenModuleView(
            viewModel: StateObject(wrappedValue: resolve(HomescreenModuleViewModel.self)!),
            settingsModuleBuilder: .init(parentAssembler: assembler),
            gameSetupModuleBuilder: .init(parentAssembler: assembler)
        )
    }
}
