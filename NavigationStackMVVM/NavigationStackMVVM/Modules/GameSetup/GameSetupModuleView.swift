import SwiftUI

struct GameSetupModuleView: View {
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
        }
        .padding(.horizontal)
        .background(Color.orange.opacity(0.1))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    viewModel.viewDidSelectLeave()
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
    }

    private func packCard(for pack: Pack) -> some View {
        Button {
            viewModel.viewDidSelect(pack: pack)
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .orange, radius: 5)
                .overlay {
                    Text(pack.title)
                        .font(.subheadline)
                        .bold()
                }
        }
    }
}
