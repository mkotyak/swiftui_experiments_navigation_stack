import SwiftUI

struct SettingsModuleView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: SettingsModuleViewModel

    init(viewModel: StateObject<SettingsModuleViewModel>) {
        self._viewModel = viewModel
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
        .navigationDestination(for: SettingsModuleNavigationItem.self) { _ in
            Text("Language picker")
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
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
        NavigationLink(value: SettingsModuleNavigationItem.languagePicker) {
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
        .withHapticAction {
            viewModel.viewDidSelectLanguage()
        }
    }
}
