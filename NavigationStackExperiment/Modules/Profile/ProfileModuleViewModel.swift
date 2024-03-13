import Foundation

class ProfileModuleViewModel: ObservableObject {
    @Published var model: ProfileModuleModel
    
    var displayName: String {
        model.user.displayName
    }
    
    var followersCount: Int {
        model.user.followers.count
    }
    
    var followingCount: Int {
        model.user.following.count
    }
    
    init(model: ProfileModuleModel) {
        self.model = model
    }
}
