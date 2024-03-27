import SwiftUI

struct GameView: View {
    @Binding var path: [NavigationItem]
    let gameSource: GameSource

    var title: String {
        switch gameSource {
        case .config(let config):
            "Game from Config for \(config.pack.title)"
        case .pack(let pack):
            "Game for \(pack.title)"
        }
    }

    var body: some View {
        VStack {
            HeaderView(title: "Game")
            Spacer()
            HStack {
                Spacer()
                Text(title)
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
                    path.removeLast()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
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
                }
            }
        }
    }
}
