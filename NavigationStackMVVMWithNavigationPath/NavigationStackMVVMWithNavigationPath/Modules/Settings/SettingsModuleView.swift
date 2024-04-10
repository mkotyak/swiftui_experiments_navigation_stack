import SwiftUI

struct SettingsModuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel: SettingsModuleViewModel

    private let languagePickerModuleBuilderAssemblerable: LanguagePickerModuleBuilderAssemblerable

    init(
        viewModel: StateObject<SettingsModuleViewModel>,
        languagePickerModuleBuilderAssemblerable: LanguagePickerModuleBuilderAssemblerable
    ) {
        self._viewModel = viewModel
        self.languagePickerModuleBuilderAssemblerable = languagePickerModuleBuilderAssemblerable
    }

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            HeaderView(title: "Settings")
            settingsItemsView
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.green.opacity(0.1))
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.isLanguagePickerDisplayed) {
            languagePickerModuleBuilderAssemblerable.view(delegate: viewModel)
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
