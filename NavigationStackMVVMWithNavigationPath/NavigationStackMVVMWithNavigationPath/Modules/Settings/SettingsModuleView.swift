import SwiftUI

struct SettingsModuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel: SettingsModuleViewModel

    private let languagePickerModuleBuilder: LanguagePickerModuleBuilder

    init(
        viewModel: StateObject<SettingsModuleViewModel>,
        languagePickerModuleBuilder: LanguagePickerModuleBuilder
    ) {
        self._viewModel = viewModel
        self.languagePickerModuleBuilder = languagePickerModuleBuilder
    }

    var body: some View {
        VStack {
            HeaderView(title: "Settings")
            settingsItemsView
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.green.opacity(0.1))
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.isLanguagePickerDisplayed) {
            languagePickerModuleBuilder.view(delegate: viewModel)
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

    private var settingsItemsView: some View {
        VStack(spacing: 20) {
            languageSettingItem
            settingsItem(title: "Rate Us") {
                debugPrint("Rate Us")
            }
            settingsItem(title: "Restore Purchases") {
                debugPrint("Restore Purchases")
            }
        }
    }

    private var languageSettingItem: some View {
        Button {
            viewModel.viewDidSelectLanguage()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .green, radius: 5)
                .frame(height: 60)
                .overlay {
                    Text("Language")
                        .font(.headline)
                        .bold()
                }
        }
    }
}
