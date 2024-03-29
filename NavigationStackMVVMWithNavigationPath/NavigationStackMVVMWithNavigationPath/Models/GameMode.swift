import Foundation

enum GameMode: CaseIterable, Identifiable {
    case one
    case two
    case three

    var id: String {
        switch self {
        case .one:
            "one"
        case .two:
            "two"
        case .three:
            "three"
        }
    }

    var title: String {
        switch self {
        case .one:
            "One"
        case .two:
            "Two"
        case .three:
            "Three"
        }
    }
}
