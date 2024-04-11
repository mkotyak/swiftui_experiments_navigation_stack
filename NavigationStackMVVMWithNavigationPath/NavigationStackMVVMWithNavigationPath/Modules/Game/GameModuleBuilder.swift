import SwiftUI
import Swinject

struct GameModuleBuilder: ModuleBuilderProtocol {
    let assembler: Assembler

    var assembly: Assembly? {
        GameModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func view(
        gameSource: GameSource,
        delegate: GameModuleDelegate
    ) -> GameModuleView {
        let viewModelAssembler = Assembler(parentAssembler: assembler)
        viewModelAssembler.apply(assemblies: [
            DependencyAssembly(gameSource),
            DependencyAssembly(delegate)
        ])

        return GameModuleView(
            viewModel: StateObject(wrappedValue: viewModelAssembler.resolver.resolve(GameModuleViewModel.self)!)
        )
    }
}
