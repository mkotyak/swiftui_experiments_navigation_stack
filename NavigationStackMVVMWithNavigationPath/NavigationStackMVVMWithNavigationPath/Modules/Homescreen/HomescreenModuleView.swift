import SwiftUI

struct HomescreenModuleView: View {
    @StateObject private var viewModel: HomescreenModuleViewModel
    private let settingsModuleBuilder: SettingsModuleBuilder

    init(
        viewModel: StateObject<HomescreenModuleViewModel>,
        settingsModuleBuilder: SettingsModuleBuilder
    ) {
        self._viewModel = viewModel
        self.settingsModuleBuilder = settingsModuleBuilder
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: HomescreenModuleNavigationItem.self) { _ in
                settingsModuleBuilder.view()
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
