import Foundation
import SwiftUI

final class LanguagePickerModuleViewModel: ObservableObject {
    @Binding private var path: [NavigationItem]
    
    init(path: Binding<[NavigationItem]>) {
        self._path = path
    }
    
    // MARK: - Intents
    
    func viewDidSelecrLeave() {
        path.removeLast()
    }
}
