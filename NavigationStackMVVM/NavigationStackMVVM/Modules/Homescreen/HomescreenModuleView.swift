import SwiftUI

struct HomescreenModuleView: View {
    @StateObject private var viewModel: HomescreenModuleViewModel
    private let navigationController: NavigationController

    init(
        viewModel: StateObject<HomescreenModuleViewModel>,
        navigationController: NavigationController
    ) {
        self._viewModel = viewModel
        self.navigationController = navigationController
    }

    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 8) {
                HeaderView(title: "Homescreen")
                Spacer()
                ForEach(GameMode.allCases) { gameMode in
                    gameModeView(for: gameMode)
                }
                .padding(.vertical, 6)
                Spacer()
            }
            .padding(.horizontal)
            .background(Color.purple.opacity(0.1))
            .navigationDestination(for: NavigationItem.self) { navigationItem in
                // First Approach - When Homescreen uses navigationController to build navigation destinations
                navigationController.navigate(to: navigationItem, path: $viewModel.path)

                // Second Approach - When Homescreen build navigation destinations by itself
//                switch navigationItem {
//                case .settings:
//                    SettingsView(path: $path)
//                case .languagePicker:
//                    LanguagePickerView(path: $path)
//                case .gameSetup(let gameMode):
//                    GameSetupView(
//                        path: $path,
//                        gameMode: gameMode
//                    )
//                case .game(let gameSource):
//                    GameView(
//                        path: $path,
//                        gameSource: gameSource
//                    )
//                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.viewDidSelectDeeplink()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.viewDidSelectSettings()
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                    }
                }
            }
        }
    }

    private func gameModeView(for gameMode: GameMode) -> some View {
        Button {
            viewModel.viewDidSelect(gameMode: gameMode)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .purple, radius: 5)
                .overlay {
                    Text(gameMode.title)
                        .font(.headline)
                        .bold()
                }
        }
    }
}
