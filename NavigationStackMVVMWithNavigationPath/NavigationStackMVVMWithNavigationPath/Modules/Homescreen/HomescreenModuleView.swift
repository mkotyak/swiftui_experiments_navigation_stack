import SwiftUI

struct HomescreenModuleView: View {
    @StateObject private var viewModel: HomescreenModuleViewModel

    init(viewModel: StateObject<HomescreenModuleViewModel>) {
        self._viewModel = viewModel
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
            .navigationDestination(for: HomescreenModuleNavigationItem.self) { navigationItem in
                Text("\(navigationItem)")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingButton
                }
            }
        }
    }

    private func gameModeView(for gameMode: GameMode) -> some View {
        NavigationLink(value: HomescreenModuleNavigationItem.gameSetup(gameMode)) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .purple, radius: 5)
                .overlay {
                    Text(gameMode.title)
                        .font(.headline)
                        .bold()
                }
        }
        .withHapticAction {
            viewModel.viewDidSelect(gameMode)
        }
    }

    private var settingButton: some View {
        NavigationLink(value: HomescreenModuleNavigationItem.settings) {
            Image(systemName: "gearshape")
                .resizable()
        }
        .withHapticAction {
            viewModel.viewDidSelectSettings()
        }
    }
}
