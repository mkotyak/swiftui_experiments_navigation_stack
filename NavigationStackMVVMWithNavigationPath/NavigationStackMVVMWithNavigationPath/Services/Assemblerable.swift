import Swinject

protocol Assemblerable {
    var assembly: Assembly? { get }
    var assembler: Assembler { get }

    init(assembler: Assembler)
    init(parentAssembler: Assembler)
}

extension Assemblerable {
    var assembly: Assembly? {
        return nil
    }

    init(parentAssembler: Assembler) {
        self.init(assembler: Assembler(parentAssembler: parentAssembler))

        if let assembly {
            self.assembler.apply(assembly: assembly)
        }
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        assembler.resolver.resolve(serviceType)
    }
}
