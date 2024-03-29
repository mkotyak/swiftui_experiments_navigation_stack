import Foundation

final class LanguageModuleViewModel: ObservableObject {
    // MARK: - Intents

    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
