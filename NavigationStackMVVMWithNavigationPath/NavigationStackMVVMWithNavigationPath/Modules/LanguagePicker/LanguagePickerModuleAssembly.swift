import Swinject

final class LanguagePickerModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(LanguagePickerModuleViewModel.self) { resolver in
            LanguagePickerModuleViewModel(
                delegate: resolver.resolve(LanguagePickerModuleDelegate.self)!
            )
        }
    }
}
