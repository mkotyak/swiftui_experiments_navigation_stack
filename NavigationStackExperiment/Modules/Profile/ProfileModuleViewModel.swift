import Foundation
import SwiftUI

class ProfileModuleViewModel: ObservableObject {
    @Published var model: ProfileModuleModel
    @Published var path: NavigationPath = .init()
    
    var displayName: String {
        model.currentUser.displayName
    }
    
    var followers: [User] {
        model.currentUser.followers
    }
    
    var following: [User] {
        model.currentUser.following
    }
    
    init(model: ProfileModuleModel) {
        self.model = model
    }
}
