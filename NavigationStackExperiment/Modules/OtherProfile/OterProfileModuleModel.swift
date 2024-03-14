import Foundation

struct OterProfileModuleModel {
    private(set) var otherUser: User

    init(otherUser: User) {
        self.otherUser = otherUser
    }
}
