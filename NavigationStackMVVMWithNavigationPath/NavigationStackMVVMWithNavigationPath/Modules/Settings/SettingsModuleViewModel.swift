import Foundation

final class SettingsModuleViewModel: ObservableObject {
    @Published var isLanguagePickerDisplayed: Bool = false

    // MARK: - Intenst

    func viewDidSelectLanguage() {
        isLanguagePickerDisplayed = true
    }

    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}

// MARK: - LanguagePickerModuleDelegate

extension SettingsModuleViewModel: LanguagePickerModuleDelegate {
    func languagePickerDidSubmitNewLanguage() {
        debugPrint("SettingsModuleViewModel: languagePickerDidSubmitNewLanguage")
        isLanguagePickerDisplayed = false
    }
}
