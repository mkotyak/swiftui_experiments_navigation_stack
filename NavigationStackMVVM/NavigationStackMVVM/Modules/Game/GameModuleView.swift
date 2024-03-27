import SwiftUI

struct GameModuleView: View {
    @StateObject private var viewModel: GameModuleViewModel

    init(viewModel: StateObject<GameModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack {
            HeaderView(title: "Game")
            Spacer()
            HStack {
                Spacer()
                Text(viewModel.description)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color.red.opacity(0.1))
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
}
