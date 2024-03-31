import Foundation

struct Pack: Identifiable {
    let id: UUID = .init()
    let title: String
    let cards: [Card]
}

extension Pack: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        cards.forEach { card in
            hasher.combine(card.hashValue)
        }
    }
}
