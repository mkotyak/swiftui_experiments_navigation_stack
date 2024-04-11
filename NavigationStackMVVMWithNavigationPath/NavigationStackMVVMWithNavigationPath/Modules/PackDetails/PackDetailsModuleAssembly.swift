import Swinject

final class PackDetailsModuleAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(PackDetailsModuleModel.self) { resolver in
            PackDetailsModuleModel(pack: resolver.resolve(Pack.self)!)
        }

        container.register(PackDetailsModuleViewModel.self) { resolver in
            PackDetailsModuleViewModel(
                model: resolver.resolve(PackDetailsModuleModel.self)!,
                delegate: resolver.resolve(PackDetailsModuleDelegate.self)!
            )
        }
    }
}
