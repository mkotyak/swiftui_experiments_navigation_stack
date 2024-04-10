import Swinject

final class SettingsModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(SettingsModuleViewModel.self) { _ in
            SettingsModuleViewModel()
        }
    }
}
