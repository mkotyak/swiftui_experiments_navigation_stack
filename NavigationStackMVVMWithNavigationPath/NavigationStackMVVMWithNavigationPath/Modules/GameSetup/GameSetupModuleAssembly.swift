import Swinject

final class GameSetupModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(GameSetupModuleModel.self) { resolver in
            GameSetupModuleModel(gameMode: resolver.resolve(GameMode.self)!)
        }

        container.register(GameSetupModuleViewModel.self) { resolver in
            GameSetupModuleViewModel(model: resolver.resolve(GameSetupModuleModel.self)!)
        }
    }
}
