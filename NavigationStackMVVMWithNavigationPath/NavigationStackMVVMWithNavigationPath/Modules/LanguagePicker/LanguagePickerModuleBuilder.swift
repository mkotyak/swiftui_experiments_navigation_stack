import Foundation

final class LanguagePickerModuleBuilder {
    init() {
      debugPrint("🚘 LanguagePickerModuleBuilder - INIT")
    }
    
    deinit {
        debugPrint("🚘 LanguagePickerModuleBuilder - DEINIT")
    }
    
    func view() -> LanguagePickerModuleView {
        LanguagePickerModuleView()
    }
}
