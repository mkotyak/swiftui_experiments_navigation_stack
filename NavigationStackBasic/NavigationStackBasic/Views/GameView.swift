import SwiftUI

struct GameView: View {
    @Binding var path: [NavigationItem]
    let gameSource: GameSource

    var title: String {
        switch gameSource {
        case .config(let config):
            "Game from Game Config for \(config.pack.title)"
        case .pack(let pack):
            "Game for \(pack.title)"
        }
    }

    var body: some View {
        Text("Game for \(title)")
            .background(Color.green.opacity(0.1))
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton {
                        path.removeLast()
                    }
                }
            }
    }
}
