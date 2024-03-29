import Foundation

enum GameSource {
    case config(GameConfig)
    case pack(Pack)
}

extension GameSource: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .config(let gameConfig):
            hasher.combine("config")
            hasher.combine(gameConfig.gameID)
        case .pack(let pack):
            hasher.combine("pack")
            hasher.combine(pack.id)
        }
    }
}
