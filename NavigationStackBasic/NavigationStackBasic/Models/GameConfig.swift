import Foundation

struct GameConfig {
    let gameID: UUID = .init()
    let gameCards: [Card]
}

extension GameConfig: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(gameID)
        gameCards.forEach { card in
            hasher.combine(card.hashValue)
        }
    }
}
