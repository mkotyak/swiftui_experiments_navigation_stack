import SwiftUI

@main
struct NavigationStackMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            HomescreenModuleBuilder().view()
        }
    }
}
