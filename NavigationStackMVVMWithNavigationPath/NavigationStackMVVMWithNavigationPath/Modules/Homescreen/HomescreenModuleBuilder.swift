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
            gameSetupModuleBuilder: .init()
        )
    }
}

//
//extension HomescreenModuleBuilder: Hashable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        true
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(String(describing: self))
//    }
//}
