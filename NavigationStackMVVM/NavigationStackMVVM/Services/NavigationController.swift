import SwiftUI

class NavigationController {
    private let settingsModuleBuilder: SettingsModuleBuilder
    private let languagePickerModuleBuilder: LanguagePickerModuleBuilder
    private let gameSetupModuleBuilder: GameSetupModuleBuilder

    init(
        settingsModuleBuilder: SettingsModuleBuilder,
        languagePickerModuleBuilder: LanguagePickerModuleBuilder,
        gameSetupModuleBuilder: GameSetupModuleBuilder
    ) {
        self.settingsModuleBuilder = settingsModuleBuilder
        self.languagePickerModuleBuilder = languagePickerModuleBuilder
        self.gameSetupModuleBuilder = gameSetupModuleBuilder
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
            GameModuleView(
                path: path,
                gameSource: gameSource
            )
        }
    }
}
