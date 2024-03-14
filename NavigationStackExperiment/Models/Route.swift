import Foundation

enum Route {
    case followers([User])
    case following([User])
    case otherProfile(User)
}

extension Route: Equatable, Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case let (.followers(lhsFollowers), .followers(rhsFollowers)):
            return lhsFollowers == rhsFollowers
        case let (.following(lhsFollowing), .following(rhsFollowing)):
            return lhsFollowing == rhsFollowing
        case let (.otherProfile(lhsUser), .otherProfile(rhsUser)):
            return lhsUser.id == rhsUser.id
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case let .followers(followers):
            hasher.combine("followers")
            hasher.combine(followers.hashValue)
        case let .following(following):
            hasher.combine("following")
            hasher.combine(following.hashValue)
        case let .otherProfile(user):
            hasher.combine("otherProfile")
            hasher.combine("\(user.id)")
        }
    }
}
