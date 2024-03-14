import Foundation

class OtherProfileModuleViewModel: ObservableObject {
    @Published var model: OterProfileModuleModel
    
    var userName: String {
        model.otherUser.userName
    }
    
    var displayName: String {
        model.otherUser.displayName
    }
    
    var followers: [User] {
        model.otherUser.followers
    }
    
    var following: [User] {
        model.otherUser.following
    }
    
    init(model: OterProfileModuleModel) {
        self.model = model
    }
}
