import SwiftUI

struct HomescreenView: View {
    @State var path: [NavigationItem] = []

    var body: some View {
        NavigationStack(path: $path) {
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        debugPrint("Deeplink")
                    } label: {
                        Image(systemName: "menucard")
                            .resizable()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(.settings)
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                    }
                }
            }
        }
    }

    private func gameModeView(for gameMode: GameMode) -> some View {
        Button {
            path.append(.gameSetup(gameMode))
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .purple, radius: 5)
                .overlay {
                    Text(gameMode.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .bold()
                }
        }
    }
}
