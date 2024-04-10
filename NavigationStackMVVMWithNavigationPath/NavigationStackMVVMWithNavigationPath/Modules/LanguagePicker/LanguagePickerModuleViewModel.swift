import Foundation

final class LanguageModuleViewModel: ObservableObject {
    private weak var delegate: LanguagePickerModuleDelegate?

    init(delegate: LanguagePickerModuleDelegate) {
        self.delegate = delegate
    }

    // MARK: - Intents

    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }

    func viewDidSelectLanguage() {
        delegate?.languagePickerDidSubmitNewLanguage()
    }
}
