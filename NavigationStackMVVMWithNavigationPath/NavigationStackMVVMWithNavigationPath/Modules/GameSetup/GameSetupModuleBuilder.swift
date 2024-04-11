import SwiftUI
import Swinject

struct GameSetupModuleBuilder: ModuleBuilderProtocol {
    let assembler: Assembler

    var assembly: Assembly? {
        GameSetupModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func view(gameMode: GameMode) -> GameSetupModuleView {
        let viewModelAssembler = Assembler(parentAssembler: assembler)
        viewModelAssembler.apply(assembly: DependencyAssembly(gameMode))

        return GameSetupModuleView(
            viewModel: StateObject(
                wrappedValue: viewModelAssembler.resolver.resolve(GameSetupModuleViewModel.self)!
            ),
            gameModuleBuilder: .init(parentAssembler: assembler),
            packDetailsModuleBuilde: .init(parentAssembler: assembler)
        )
    }
}
