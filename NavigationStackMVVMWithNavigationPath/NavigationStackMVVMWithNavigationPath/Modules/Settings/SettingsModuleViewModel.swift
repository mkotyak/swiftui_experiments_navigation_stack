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

extension SettingsModuleViewModel: Hashable {
    static func == (lhs: SettingsModuleViewModel, rhs: SettingsModuleViewModel) -> Bool {
//        Unmanaged.passUnretained(lhs).toOpaque() == Unmanaged.passUnretained(rhs).toOpaque()
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
//        hasher.combine(Unmanaged.passUnretained(self).toOpaque())
        hasher.combine(ObjectIdentifier(self))
    }
}
