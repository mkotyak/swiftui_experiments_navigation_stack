import Foundation

struct ProfileModuleModel {
    private(set) var currentUser: User = .init(
        displayName: "LeBrone James",
        userName: "@lebrone_james",
        followers: [
            .init(
                displayName: "Ivan Petrov",
                userName: "@vano123",
                followers: [
                    .init(displayName: "Laura Thompson", userName: "@LauraThompson"),
                    .init(displayName: "James Richardson", userName: "@JamesRichardson"),
                    .init(displayName: "Amanda Wilson", userName: "@AmandaWilson"),
                ],
                following: [
                    .init(displayName: "Robert Smith", userName: "@Robert Smith"),
                    .init(displayName: " Emily Johnson", userName: "@EmilyJohnson"),
                ]
            ),
            .init(
                displayName: "Misha Ivanov",
                userName: "@korzik",
                followers: [
                    .init(displayName: "Brian Davis", userName: "@BrianDavis"),
                    .init(displayName: "Charlotte Brown", userName: "@CharlotteBrown"),
                    .init(displayName: "Ethan Miller", userName: "@EthanMiller"),
                    .init(displayName: "Lisa Evans", userName: "@LisaEvans"),
                ],
                following: [
                    .init(displayName: "Ryan Taylor", userName: "@RyanTaylor"),
                ]
            ),
            .init(
                displayName: "Anna German",
                userName: "@annaanna",
                followers: [
                    .init(displayName: "Hannah Jones", userName: "@HannahJones"),
                    .init(displayName: "Benjamin Clarke", userName: "@BenjaminClarke"),
                    .init(displayName: "Rebecca Wilson", userName: "@RebeccaWilson"),
                    .init(displayName: "Michael Thomas", userName: "@MichaelThomas"),
                ],
                following: [
                    .init(displayName: "Sophia Jackson", userName: "@SophiaJackson"),
                    .init(displayName: "Daniel Harris", userName: "@DanielHarris"),
                ]
            ),
            .init(
                displayName: "Valeria Ruma",
                userName: "@lera_ruma",
                followers: [
                    .init(displayName: "Rebecca Wilson", userName: "@RebeccaWilson"),
                    .init(displayName: "Michael Thomas", userName: "@MichaelThomas"),
                ],
                following: [
                    .init(displayName: "Sophia Jackson", userName: "@SophiaJackson"),
                    .init(displayName: "Daniel Harris", userName: "@DanielHarris"),
                ]
            ),
        ],
        following: [
            .init(
                displayName: "Ivan Petrov",
                userName: "@vano123",
                followers: [
                    .init(displayName: "Hannah Jones", userName: "@HannahJones"),
                    .init(displayName: "Benjamin Clarke", userName: "@BenjaminClarke"),
                ],
                following: [
                    .init(displayName: "Sophia Jackson", userName: "@SophiaJackson"),
                    .init(displayName: "Daniel Harris", userName: "@DanielHarris"),
                    .init(displayName: "Rebecca Wilson", userName: "@RebeccaWilson"),
                    .init(displayName: "Michael Thomas", userName: "@MichaelThomas"),
                ]
            ),
            .init(
                displayName: "Misha Ivanov",
                userName: "@korzik",
                followers: [
                    .init(displayName: "Hannah Jones", userName: "@HannahJones"),
                ],
                following: [
                    .init(displayName: "Sophia Jackson", userName: "@SophiaJackson"),
                ]
            ),
        ]
    )
}
