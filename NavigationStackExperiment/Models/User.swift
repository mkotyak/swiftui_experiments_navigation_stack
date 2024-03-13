import Foundation

struct User: Identifiable {
    let id: UUID = .init()
    var displayName: String
    var userName: String
    var followers: [User] = []
    var following: [User] = []
}
