import SwiftUI

@main
struct NavigationStackMVVMWithNavigationPathApp: App {
    var body: some Scene {
        WindowGroup {
            HomescreenModuleBuilder().view()
        }
    }
}
