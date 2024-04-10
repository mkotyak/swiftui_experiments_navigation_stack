import SwiftUI
import Swinject

struct LanguagePickerModuleBuilder: Assemblerable {
    let assembler: Assembler

    var assembly: Assembly? {
        LanguagePickerModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func view(delegate: LanguagePickerModuleDelegate) -> LanguagePickerModuleView {
        let viewModelAssembler = Assembler(parentAssembler: assembler)
        viewModelAssembler.apply(assembly: DependencyAssembly(delegate))

        return LanguagePickerModuleView(
            viewModel: StateObject(wrappedValue:
                viewModelAssembler.resolver.resolve(LanguageModuleViewModel.self)!
            )
        )
    }
}
