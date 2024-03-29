import Foundation

struct GameConfig {
    let gameID: UUID = .init()
    let packs: [Pack]
}

extension GameConfig: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(gameID)
        packs.forEach { pack in
            hasher.combine(pack.hashValue)
        }
    }
}
