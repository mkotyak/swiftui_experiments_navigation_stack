import SwiftUI

struct NavigationController {
    private let settingsModuleBuilder: SettingsModuleBuilder
    private let languagePickerModuleBuilder: LanguagePickerModuleBuilder
    private let gameSetupModuleBuilder: GameSetupModuleBuilder
    private let gameModuleBuilder: GameModuleBuilder

    init(
        settingsModuleBuilder: SettingsModuleBuilder,
        languagePickerModuleBuilder: LanguagePickerModuleBuilder,
        gameSetupModuleBuilder: GameSetupModuleBuilder,
        gameModuleBuilder: GameModuleBuilder
    ) {
        self.settingsModuleBuilder = settingsModuleBuilder
        self.languagePickerModuleBuilder = languagePickerModuleBuilder
        self.gameSetupModuleBuilder = gameSetupModuleBuilder
        self.gameModuleBuilder = gameModuleBuilder
    }

    @ViewBuilder
    func navigate(
        to navigationItem: NavigationItem,
        path: Binding<[NavigationItem]>
    ) -> some View {
        switch navigationItem {
        case .settings:
            settingsModuleBuilder.view(path: path)
        case .languagePicker:
            languagePickerModuleBuilder.view(path: path)
        case .gameSetup(let gameMode):
            gameSetupModuleBuilder.view(
                path: path,
                gameMode: gameMode
            )
        case .game(let gameSource):
            gameModuleBuilder.view(
                path: path,
                gameSource: gameSource
            )
        }
    }
}
