import SwiftUI

struct GameView: View {
    @Binding var path: [NavigationItem]
    let pack: Pack

    var body: some View {
        Text("Game for \(pack.title)")
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
