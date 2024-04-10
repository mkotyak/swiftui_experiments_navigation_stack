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

extension LanguageModuleViewModel: Hashable {
    static func == (lhs: LanguageModuleViewModel, rhs: LanguageModuleViewModel) -> Bool {
//        Unmanaged.passUnretained(lhs).toOpaque() == Unmanaged.passUnretained(rhs).toOpaque()
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }

    func hash(into hasher: inout Hasher) {
//        hasher.combine(Unmanaged.passUnretained(self).toOpaque())
        hasher.combine(ObjectIdentifier(self))
    }
}
