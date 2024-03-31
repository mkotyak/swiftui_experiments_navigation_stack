import Foundation

struct GameSetupModuleModel {
    let gameMode: GameMode
    
    var packs: [Pack] = []
    
    init(gameMode: GameMode) {
        self.gameMode = gameMode
        initPacks()
    }
    
    mutating func initPacks() {
        packs = [
            .init(title: "GM \(gameMode.title) - Pack 1", cards: [
                .init(text: "GM \(gameMode.title) - Pack 1: Card 1"),
                .init(text: "GM \(gameMode.title) - Pack 1: Card 2"),
                .init(text: "GM \(gameMode.title) - Pack 1: Card 3"),
            ]),
            .init(title: "GM \(gameMode.title) - Pack 2", cards: [
                .init(text: "GM \(gameMode.title) - Pack 2: Card 1"),
                .init(text: "GM \(gameMode.title) - Pack 2: Card 2"),
                .init(text: "GM \(gameMode.title) - Pack 2: Card 3"),
            ]),
            .init(title: "GM \(gameMode.title) - Pack 3", cards: [
                .init(text: "GM \(gameMode.title) - Pack 3: Card 1"),
                .init(text: "GM \(gameMode.title) - Pack 3: Card 2"),
                .init(text: "GM \(gameMode.title) - Pack 3: Card 3"),
            ]),
        ]
    }
}
