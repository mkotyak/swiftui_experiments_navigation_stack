import Foundation

enum NavigationItem {
    case settings
    case languagePicker
    case gameSetup(GameMode)
    case game(GameSource)

    var debugDescription: String {
        switch self {
        case .settings:
            "PATH - Settings"
        case .languagePicker:
            "PATH - LanguagePicker"
        case .gameSetup(let gameMode):
            "PATH - GameSetup mode: \(gameMode)"
        case .game(let gameSource):
            switch gameSource {
            case .config(let gameConfig):
                "PATH - Game + Config: \(gameConfig.pack.title)"
            case .pack(let pack):
                "PATH - Game + Pack: \(pack.title)"
            }
        }
    }
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
