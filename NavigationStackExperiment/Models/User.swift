import Foundation

struct User: Identifiable, Equatable, Hashable {
    let id: UUID = .init()
    var displayName: String
    var userName: String
    var followers: [User] = []
    var following: [User] = []
}
