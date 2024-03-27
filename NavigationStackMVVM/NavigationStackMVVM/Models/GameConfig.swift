import Foundation

struct GameConfig {
    let gameID: UUID = .init()
    let pack: Pack
}

extension GameConfig: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(gameID)
        hasher.combine(pack.hashValue)
    }
}
