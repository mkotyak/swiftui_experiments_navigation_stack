import SwiftUI

class NavigationController {
    @ViewBuilder
    func navigate(
        to navigationItem: NavigationItem,
        path: Binding<[NavigationItem]>
    ) -> some View {
        switch navigationItem {
        case .settings:
            SettingsModuleView(path: path)
        case .languagePicker:
            LanguagePickerModuleView(path: path)
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
