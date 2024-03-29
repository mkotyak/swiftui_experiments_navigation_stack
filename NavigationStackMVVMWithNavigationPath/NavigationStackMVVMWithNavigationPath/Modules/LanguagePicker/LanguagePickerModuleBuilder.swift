import Foundation

struct LanguagePickerModuleBuilder {
    init() {
      debugPrint("🚘 LanguagePickerModuleBuilder - INIT")
    }
    
    func view() -> LanguagePickerModuleView {
        LanguagePickerModuleView()
    }
}
