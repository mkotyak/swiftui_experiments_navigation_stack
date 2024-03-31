import SwiftUI

struct GameModuleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: GameModuleViewModel

    init(viewModel: StateObject<GameModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        ZStack {
            mainContentView

            if viewModel.isConfirmationPopupPresented {
                confirmationPopupView
            }
        }
        .background(Color.red.opacity(0.1))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    withAnimation {
                        viewModel.viewDidSelectLeave()
                    }
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
        .onAppear {
            UINavigationControllerConstants.isSwipeBackEnabled = false
        }
        .onDisappear {
            UINavigationControllerConstants.isSwipeBackEnabled = true
        }
        .onChange(of: viewModel.isGameCompleted) { newValue in
            guard newValue == true else {
                return
            }

            dismiss()
        }
    }

    private var mainContentView: some View {
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
    }

    private var confirmationPopupView: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 200)
                    .foregroundStyle(.white)
                    .overlay {
                        VStack {
                            Text("Are you sure you want to leave?")
                                .multilineTextAlignment(.center)
                                .font(.title)

                            Spacer()

                            Button {
                                viewModel.viewDidConfirmLeaving()
                            } label: {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(.orange)
                                    .frame(height: 54)
                                    .frame(maxWidth: .infinity)
                                    .overlay {
                                        Text("Yes")
                                            .font(.subheadline)
                                            .minimumScaleFactor(0.4)
                                            .padding(.horizontal, 8)
                                    }
                            }
                        }
                        .padding()
                    }
                Spacer()
            }

            Spacer()
        }
        .background(Color.black.opacity(0.3))
    }
}
