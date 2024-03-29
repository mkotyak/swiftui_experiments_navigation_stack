import SwiftUI

struct GameSetupModuleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: GameSetupModuleViewModel

    init(viewModel: StateObject<GameSetupModuleViewModel>) {
        self._viewModel = viewModel
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
        .navigationDestination(for: GameSetupModuleNavigationItem.self) { _ in
            Text("Game")
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
                }
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
