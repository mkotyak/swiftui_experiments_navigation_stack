import SwiftUI

struct GameSetupModuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
        }
        .padding([.horizontal, .bottom])
        .background(Color.orange.opacity(0.1))
        .navigationBarBackButtonHidden()
        .navigationDestination(for: GameSetupModuleNavigationItem.self) { item in
            navigationDestination(for: item)
        }
        /// This navigationDestination is used for navigation from PackDetails sheet, to not inject @Binding on NavigationPath.
        /// @TODO: Need to update it to ".navigationDestination(item: Binding<Optional<Hashable>>, destination: (Hashable) -> View)" after we will support iOS 17* only
        .navigationDestination(isPresented: $viewModel.isNavigationItemAvailable) {
            if let item = viewModel.navigationItem {
                navigationDestination(for: item)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                DeeplinkButton {
                    viewModel.viewDidSelectDeeplink()
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
                .foregroundStyle(.white)
                .shadow(color: .orange, radius: 5)
                .overlay {
                    Text(pack.title)
                        .font(.subheadline)
                        .bold()
                }
        }
    }

    private func navigationDestination(for item: GameSetupModuleNavigationItem) -> some View {
        switch item {
        case .game(let gameSource):
            gameModuleBuilder.view(
                gameSource: gameSource,
                delegate: viewModel
            ).id(item)
        }
    }
}
