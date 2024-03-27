import Foundation
import SwiftUI

final class SettingsModuleViewModel: ObservableObject {
    @Binding private var path: [NavigationItem]
    
    init(path: Binding<[NavigationItem]>) {
        self._path = path
    }
    
    // MARK: Intents
    
    func viewDidSelectLanguage() {
        path.append(.languagePicker)
    }
    
    func viewDidSelectLeave() {
        path.removeLast()
    }
}
