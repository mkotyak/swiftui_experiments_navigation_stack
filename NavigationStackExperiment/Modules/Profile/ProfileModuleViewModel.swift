import Foundation
import SwiftUI

class ProfileModuleViewModel: ObservableObject {
    @Published var model: ProfileModuleModel
    @Published var path: NavigationPath = .init()
    
    var displayName: String {
        model.user.displayName
    }
    
    var followers: [User] {
        model.user.followers
    }
    
    var following: [User] {
        model.user.following
    }
    
    var followersCount: Int {
        followers.count
    }
    
    var followingCount: Int {
        following.count
    }
    
    init(model: ProfileModuleModel) {
        self.model = model
    }
}
