import SwiftUI
import Swinject

struct HomescreenModuleBuilder: Assemblerable {
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
            gameSetupModuleBuilder: .init()
        )
    }
}
