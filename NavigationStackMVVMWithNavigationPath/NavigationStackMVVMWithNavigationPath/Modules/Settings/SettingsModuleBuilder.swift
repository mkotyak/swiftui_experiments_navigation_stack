import SwiftUI
import Swinject

struct SettingsModuleBuilder: ModuleBuilderProtocol {
    let assembler: Assembler

    var assembly: Assembly? {
        SettingsModuleAssembly()
    }

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func view() -> SettingsModuleView {
        SettingsModuleView(
            viewModel: StateObject(wrappedValue: resolve(SettingsModuleViewModel.self)!),
            LanguagePickerModuleBuilder: LanguagePickerModuleBuilder(parentAssembler: assembler)
//            LanguagePickerModuleBuilder: LanguagePickerModuleBuilder()
        )
    }
}
//
//extension SettingsModuleBuilder: Hashable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        true
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(String(describing: self))
//    }
//}
