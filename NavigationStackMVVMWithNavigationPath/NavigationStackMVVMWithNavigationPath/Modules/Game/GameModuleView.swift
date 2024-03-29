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
        .onAppear {
            UINavigationControllerConstants.isSwipeBackEnabled = false
        }
        .onDisappear {
            UINavigationControllerConstants.isSwipeBackEnabled = true
        }
        .background(Color.red.opacity(0.1))
        .navigationBarBackButtonHidden()
        .onChange(of: viewModel.isGameCompleted, perform: { newValue in
            guard newValue == true else {
                return
            }

            dismiss()
        })
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    withAnimation {
                        viewModel.viewDidSelectLeave()
                    }
                }
            }
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
