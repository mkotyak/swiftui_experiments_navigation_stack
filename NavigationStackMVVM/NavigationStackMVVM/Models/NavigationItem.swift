import Foundation

enum NavigationItem {
    case settings
    case languagePicker
    case gameSetup(GameMode)
    case game(GameSource)
}

extension NavigationItem: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .settings:
            hasher.combine("settings")
        case .languagePicker:
            hasher.combine("languagePicker")
        case .gameSetup(let gameMode):
            hasher.combine("gameSetup")
            hasher.combine(gameMode.hashValue)
        case .game(let gameSource):
            hasher.combine("game")
            hasher.combine(gameSource.hashValue)
        }
    }
}
