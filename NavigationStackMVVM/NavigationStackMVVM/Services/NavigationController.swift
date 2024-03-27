import SwiftUI

class NavigationController {
    private let settingsModuleBuilder: SettingsModuleBuilder
    private let languagePickerModuleBuilder: LanguagePickerModuleBuilder
    
    init(
        settingsModuleBuilder: SettingsModuleBuilder,
        languagePickerModuleBuilder: LanguagePickerModuleBuilder
    ) {
        self.settingsModuleBuilder = settingsModuleBuilder
        self.languagePickerModuleBuilder = languagePickerModuleBuilder
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
            GameSetupModuleView(
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
