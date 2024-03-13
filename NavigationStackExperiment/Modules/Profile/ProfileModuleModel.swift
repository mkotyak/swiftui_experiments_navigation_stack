import Foundation

struct ProfileModuleModel {
    private(set) var user: User = .init(
        displayName: "LeBrone James",
        userName: "@lebrone_james",
        followers: [
            .init(displayName: "Ivan Petrov", userName: "@vano123"),
            .init(displayName: "Misha Ivanov", userName: "@korzik"),
            .init(displayName: "Anna German", userName: "@annaanna"),
            .init(displayName: "Valeria Ruma", userName: "@lera_ruma"),
        ],
        following: [
            .init(displayName: "Ivan Petrov", userName: "@vano123"),
            .init(displayName: "Misha Ivanov", userName: "@korzik"),
            .init(displayName: "Anna German", userName: "@annaanna"),
            .init(displayName: "Valeria Ruma", userName: "@lera_ruma"),
        ]
    )
}
