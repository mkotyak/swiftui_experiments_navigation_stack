import SwiftUI

struct HomescreenView: View {
    @State var path: [NavigationItem] = []
    let navigationController: NavigationController

    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    var body: some View {
        NavigationStack(path: $path) {
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
                navigationController.navigate(to: navigationItem, path: $path)

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
                        path = [
                            .gameSetup(.three),
                            .game(.pack(.init(
                                title: "Deeplink Pack",
                                cards: []
                            )))
                        ]
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(.settings)
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                    }
                }
            }
            .onAppear {
                subscribeOnDeeplinkOpening()
            }
            .onDisappear {
                unsubscribeFromDeeplinkOpening()
            }
        }
    }

    private func gameModeView(for gameMode: GameMode) -> some View {
        Button {
            path.append(.gameSetup(gameMode))
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

    // MARK: - Deeplink

    private func subscribeOnDeeplinkOpening() {
        NotificationCenter.default.addObserver(
            forName: .onDeeplinkOpening,
            object: nil,
            queue: .main
        ) { _ in
            path = [
                .gameSetup(.three),
                .game(.pack(.init(
                    title: "Deeplink Pack",
                    cards: []
                )))
            ]
        }
    }

    private func unsubscribeFromDeeplinkOpening() {
        NotificationCenter.default.removeObserver(self)
    }
}
