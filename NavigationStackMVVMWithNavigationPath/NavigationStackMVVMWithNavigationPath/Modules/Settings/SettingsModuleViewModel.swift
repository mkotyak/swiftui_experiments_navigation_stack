import Foundation

final class SettingsModuleViewModel: ObservableObject {
    // MARK: - Intenst

    func viewDidSelectLanguage() {
        debugPrint("SettingsModuleView did select Language")
    }
    
    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
