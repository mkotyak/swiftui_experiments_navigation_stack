import SwiftUI

struct LanguagePickerModuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel: LanguageModuleViewModel

    init(viewModel: StateObject<LanguageModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Select Language")

            languageItem(title: "Russian")
            languageItem(title: "English")
            languageItem(title: "German")
            languageItem(title: "Italian")
            languageItem(title: "Spanish")

            Spacer()
        }
        .padding(.horizontal)
        .background(Color.blue.opacity(0.1))
        .navigationBarBackButtonHidden()
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

    private func languageItem(title: String) -> some View {
        Button {
            viewModel.viewDidSelectLanguage()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(color: .blue, radius: 5)
                .frame(height: 60)
                .overlay {
                    Text(title)
                        .font(.subheadline)
                        .bold()
                }
        }
    }
}
