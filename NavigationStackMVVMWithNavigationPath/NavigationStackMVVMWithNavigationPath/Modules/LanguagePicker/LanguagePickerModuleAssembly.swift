import Swinject

final class LanguagePickerModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LanguageModuleViewModel.self) { resolver in
            LanguageModuleViewModel(
                delegate: resolver.resolve(LanguagePickerModuleDelegate.self)!
            )
        }
    }
}
