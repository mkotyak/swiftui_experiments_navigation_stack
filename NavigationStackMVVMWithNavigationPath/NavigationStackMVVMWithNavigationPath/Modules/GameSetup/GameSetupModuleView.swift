import SwiftUI

struct GameSetupModuleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: GameSetupModuleViewModel

    private let gameModuleBuilder: GameModuleBuilder
    private let packDetailsModuleBuilder: PackDetailsModuleBuilder

    init(
        viewModel: StateObject<GameSetupModuleViewModel>,
        gameModuleBuilder: GameModuleBuilder,
        packDetailsModuleBuilde: PackDetailsModuleBuilder
    ) {
        self._viewModel = viewModel
        self.gameModuleBuilder = gameModuleBuilder
        self.packDetailsModuleBuilder = packDetailsModuleBuilde
    }

    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Game Mode: \(viewModel.title)")
            Spacer()
            ForEach(viewModel.packs) { pack in
                packCard(for: pack)
            }
            .padding(.vertical, 6)
            Spacer()
            playButton
        }
        .padding([.horizontal, .bottom])
        .background(Color.orange.opacity(0.1))
        .navigationBarBackButtonHidden()
        .navigationDestination(for: GameSetupModuleNavigationItem.self) { item in
            switch item {
            case .game(let gameSource):
                gameModuleBuilder.view(
                    gameSource: gameSource,
                    delegate: viewModel
                )
                .id(item)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.viewDidSelectDeeplink()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
            }
        }
        .sheet(item: $viewModel.sheetType) { type in
            switch type {
            case .packDetails(let pack):
                packDetailsModuleBuilder.view(
                    pack: pack,
                    delegate: viewModel
                )
            }
        }
    }

    private func packCard(for pack: Pack) -> some View {
        Button {
            viewModel.viewDidSelect(pack: pack)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(pack.isSelected ? .orange : .white)
                .shadow(color: .orange, radius: 5)
                .overlay {
                    Text(pack.title)
                        .font(.subheadline)
                        .bold()
                }
        }
    }

    private var playButton: some View {
        NavigationLink(value: GameSetupModuleNavigationItem.game(
            gameSource: .config(
                .init(packs: viewModel.selectedPacks))
        )) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.orange)
                .frame(height: 54)
                .frame(maxWidth: .infinity)
                .overlay {
                    Text(viewModel.selectedPacks.isEmpty
                        ? "Play"
                        : "Play (\(viewModel.selectedPacks.count))"
                    )
                    .font(.subheadline)
                    .minimumScaleFactor(0.4)
                    .padding(.horizontal, 8)
                }
        }
    }
}
