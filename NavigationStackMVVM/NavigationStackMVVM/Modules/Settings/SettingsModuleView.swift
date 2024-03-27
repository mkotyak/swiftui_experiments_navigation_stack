import SwiftUI

struct SettingsModuleView: View {
    @StateObject private var viewModel: SettingsModuleViewModel
    
    init(viewModel: StateObject<SettingsModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Settings")

            settingsItem(title: "Language") {
                viewModel.viewDidSelectLanguage()
            }
            settingsItem(title: "Rate Us") {
                debugPrint("Rate Us")
            }
            settingsItem(title: "Restore Purchases") {
                debugPrint("Restore Purchases")
            }

            Spacer()
        }
        .padding(.horizontal)
        .background(Color.green.opacity(0.1))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    viewModel.viewDidSelectLeave()
                }
            }
        }
    }

    private func settingsItem(
        title: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .green, radius: 5)
                .frame(height: 60)
                .overlay {
                    Text(title)
                        .font(.headline)
                        .bold()
                }
        }
    }
}
