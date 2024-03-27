import SwiftUI

class NavigationController {
    @ViewBuilder
    func navigate(
        to navigationItem: NavigationItem,
        path: Binding<[NavigationItem]>
    ) -> some View {
        switch navigationItem {
        case .settings:
            SettingsView(path: path)
        case .languagePicker:
            LanguagePickerView(path: path)
        case .gameSetup(let gameMode):
            GameSetupView(
                path: path,
                gameMode: gameMode
            )
        case .game(let gameSource):
            GameView(
                path: path,
                gameSource: gameSource
            )
        }
    }
}
