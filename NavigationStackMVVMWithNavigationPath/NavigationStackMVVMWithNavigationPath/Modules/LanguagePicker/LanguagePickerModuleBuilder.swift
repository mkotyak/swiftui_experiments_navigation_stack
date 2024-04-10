import SwiftUI
import Swinject

struct LanguagePickerModuleBuilder: ModuleBuilderProtocol {
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
                viewModelAssembler.resolver.resolve(LanguagePickerModuleViewModel.self)!
            )
        )
    }
}
//
//extension LanguagePickerModuleBuilder: Hashable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        true
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(String(describing: self))
//    }
//}

// struct LanguagePickerModuleBuilder {
//    func view(delegate: LanguagePickerModuleDelegate) -> LanguagePickerModuleView {
//        LanguagePickerModuleView(
//            viewModel: StateObject(wrappedValue:
//                LanguageModuleViewModel(delegate: delegate)
//            )
//        )
//    }
// }
