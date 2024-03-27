import SwiftUI

struct GameSetupView: View {
    @Binding var path: [NavigationItem]
    let packs: [Pack]

    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Choose pack")
            Spacer()
            ForEach(packs) { pack in
                packCard(for: pack)
            }
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
                    debugPrint("Deeplink")
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
            }
        }
    }

    private func packCard(for pack: Pack) -> some View {
        Button {
            path.append(
                .game(.config(
                    .init(gameCards: pack.cards)
                ))
            )
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .purple, radius: 5)
                .overlay {
                    Text(pack.title)
                        .font(.subheadline)
                        .bold()
                }
        }
    }
}
