import SwiftUI

@main
struct NavigationStackExperimentApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileModuleView(
                viewModel: StateObject(wrappedValue: ProfileModuleViewModel(
                    model: ProfileModuleModel()
                ))
            )
        }
    }
}
