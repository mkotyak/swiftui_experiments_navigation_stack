import Swinject

final class HomescreenModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(HomescreenModuleViewModel.self) { _ in
            HomescreenModuleViewModel()
        }
    }
}
