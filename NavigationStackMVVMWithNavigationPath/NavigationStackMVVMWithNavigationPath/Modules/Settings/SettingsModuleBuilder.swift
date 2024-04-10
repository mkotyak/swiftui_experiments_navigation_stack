import SwiftUI
import Swinject

struct SettingsModuleBuilder: Assemblerable {
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
            languagePickerModuleBuilderAssemblerable: LanguagePickerModuleBuilderAssemblerable(parentAssembler: assembler),
            languagePickerModuleBuilder: .init()
        )
    }
}
