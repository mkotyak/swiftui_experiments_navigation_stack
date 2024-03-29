import SwiftUI

struct LanguagePickerModuleView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Select Language")

            languageItem(title: "Russian") {
                debugPrint("Russian")
            }
            languageItem(title: "English") {
                debugPrint("English")
            }
            languageItem(title: "German") {
                debugPrint("German")
            }
            languageItem(title: "Italian") {
                debugPrint("Italian")
            }
            languageItem(title: "Spanish") {
                debugPrint("Spanish")
            }

            Spacer()
        }
        .padding(.horizontal)
        .background(Color.blue.opacity(0.1))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
                }
            }
        }
    }

    private func languageItem(
        title: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
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
