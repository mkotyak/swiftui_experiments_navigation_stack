import Swinject

final class GameModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(GameModuleViewModel.self) { resolver in
            GameModuleViewModel(
                gameSource: resolver.resolve(GameSource.self)!,
                delegate: resolver.resolve(GameModuleDelegate.self)!
            )
        }
    }
}
