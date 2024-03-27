import SwiftUI

struct GameSetupView: View {
    @Binding var path: [NavigationItem]
    let gameMode: GameMode

    var packs: [Pack] {
        switch gameMode {
        case .one:
            [
                .init(title: "GM One - Pack 1", cards: [
                    .init(text: "GM One - Pack 1: Card 1"),
                    .init(text: "GM One - Pack 1: Card 2"),
                    .init(text: "GM One - Pack 1: Card 3"),
                ]),
                .init(title: "GM One - Pack 2", cards: [
                    .init(text: "GM One - Pack 2: Card 1"),
                    .init(text: "GM One - Pack 2: Card 2"),
                    .init(text: "GM One - Pack 2: Card 3"),
                ]),
                .init(title: "GM One - Pack 3", cards: [
                    .init(text: "GM One - Pack 3: Card 1"),
                    .init(text: "GM One - Pack 3: Card 2"),
                    .init(text: "GM One - Pack 3: Card 3"),
                ]),
            ]
        case .two:
            [
                .init(title: "GM Two - Pack 1", cards: [
                    .init(text: "GM Two - Pack 1: Card 1"),
                    .init(text: "GM Two - Pack 1: Card 2"),
                    .init(text: "GM Two - Pack 1: Card 3"),
                ]),
                .init(title: "GM Two - Pack 2", cards: [
                    .init(text: "GM Two - Pack 2: Card 1"),
                    .init(text: "GM Two - Pack 2: Card 2"),
                    .init(text: "GM Two - Pack 2: Card 3"),
                ]),
                .init(title: "GM Two - Pack 3", cards: [
                    .init(text: "GM Two - Pack 3: Card 1"),
                    .init(text: "GM Two - Pack 3: Card 2"),
                    .init(text: "GM Two - Pack 3: Card 3"),
                ]),
            ]
        case .three:
            [
                .init(title: "GM Three - Pack 1", cards: [
                    .init(text: "GM Three - Pack 1: Card 1"),
                    .init(text: "GM Three - Pack 1: Card 2"),
                    .init(text: "GM Three - Pack 1: Card 3"),
                ]),
                .init(title: "GM Three - Pack 2", cards: [
                    .init(text: "GM Three - Pack 2: Card 1"),
                    .init(text: "GM Three - Pack 2: Card 2"),
                    .init(text: "GM Three - Pack 2: Card 3"),
                ]),
                .init(title: "GM Three - Pack 3", cards: [
                    .init(text: "GM Three - Pack 3: Card 1"),
                    .init(text: "GM Three - Pack 3: Card 2"),
                    .init(text: "GM Three - Pack 3: Card 3"),
                ]),
            ]
        }
    }

    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Game Mode: \(gameMode.title)")
            Spacer()
            ForEach(packs) { pack in
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
                    path.removeLast()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // First Approach - When GameSetup manage deeplinking by itself
//                    path = [
//                        .gameSetup(.three),
//                        .game(.pack(.init(
//                            title: "Deeplink Pack",
//                            cards: []
//                        )))
//                    ]

                    // Second Approach - When GameSetup posts notification aboud deeplinking to Homescreen manage it by itself
                    NotificationCenter.default.post(
                        name: .onDeeplinkOpening,
                        object: nil
                    )
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
            }
        }
    }

    private func packCard(for pack: Pack) -> some View {
        Button {
            path.append(
                .game(.config(.init(pack: pack)))
            )
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
