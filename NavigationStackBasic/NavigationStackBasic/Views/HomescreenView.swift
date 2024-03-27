import SwiftUI

struct HomescreenView: View {
    @State var path: [NavigationItem] = []

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
                switch navigationItem {
                case .settings:
                    SettingsView(path: $path)
                case .languagePicker:
                    LanguagePickerView(path: $path)
                case .gameSetup(let gameMode):
                    GameSetupView(
                        path: $path,
                        gameMode: gameMode
                    )
                case .game(let gameSource):
                    GameView(
                        path: $path,
                        gameSource: gameSource
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        debugPrint("Deeplink")
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
}
