import Foundation

struct GameSetupModuleModel {
    let gameMode: GameMode

    init(gameMode: GameMode) {
        self.gameMode = gameMode
    }

    var packs: [Pack] {
        switch gameMode {
        case .one:
            [
                .init(title: "GM One - Pack 1", cards: [
                    .init(text: "GM One - Pack 1: Card 1"),
                    .init(text: "GM One - Pack 1: Card 2"),
                    .init(text: "GM One - Pack 1: Card 3"),
                ]),
                .init(title: "GM One - Pack 2", cards: [
                    .init(text: "GM One - Pack 2: Card 1"),
                    .init(text: "GM One - Pack 2: Card 2"),
                    .init(text: "GM One - Pack 2: Card 3"),
                ]),
                .init(title: "GM One - Pack 3", cards: [
                    .init(text: "GM One - Pack 3: Card 1"),
                    .init(text: "GM One - Pack 3: Card 2"),
                    .init(text: "GM One - Pack 3: Card 3"),
                ]),
            ]
        case .two:
            [
                .init(title: "GM Two - Pack 1", cards: [
                    .init(text: "GM Two - Pack 1: Card 1"),
                    .init(text: "GM Two - Pack 1: Card 2"),
                    .init(text: "GM Two - Pack 1: Card 3"),
                ]),
                .init(title: "GM Two - Pack 2", cards: [
                    .init(text: "GM Two - Pack 2: Card 1"),
                    .init(text: "GM Two - Pack 2: Card 2"),
                    .init(text: "GM Two - Pack 2: Card 3"),
                ]),
                .init(title: "GM Two - Pack 3", cards: [
                    .init(text: "GM Two - Pack 3: Card 1"),
                    .init(text: "GM Two - Pack 3: Card 2"),
                    .init(text: "GM Two - Pack 3: Card 3"),
                ]),
            ]
        case .three:
            [
                .init(title: "GM Three - Pack 1", cards: [
                    .init(text: "GM Three - Pack 1: Card 1"),
                    .init(text: "GM Three - Pack 1: Card 2"),
                    .init(text: "GM Three - Pack 1: Card 3"),
                ]),
                .init(title: "GM Three - Pack 2", cards: [
                    .init(text: "GM Three - Pack 2: Card 1"),
                    .init(text: "GM Three - Pack 2: Card 2"),
                    .init(text: "GM Three - Pack 2: Card 3"),
                ]),
                .init(title: "GM Three - Pack 3", cards: [
                    .init(text: "GM Three - Pack 3: Card 1"),
                    .init(text: "GM Three - Pack 3: Card 2"),
                    .init(text: "GM Three - Pack 3: Card 3"),
                ]),
            ]
        }
    }
}
