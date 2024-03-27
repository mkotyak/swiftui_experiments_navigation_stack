import Foundation

struct Card {
    let id: UUID = .init()
    let text: String
}

extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(text)
    }
}
