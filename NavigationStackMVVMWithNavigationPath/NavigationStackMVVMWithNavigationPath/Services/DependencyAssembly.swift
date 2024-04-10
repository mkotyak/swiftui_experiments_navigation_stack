import Foundation
import Swinject

struct DependencyAssembly<EntityType>: Assembly {
    let entity: EntityType

    init(_ component: EntityType) {
        self.entity = component
    }

    func assemble(container: Swinject.Container) {
        container.register(EntityType.self) { _ in
            entity
        }
    }
}
