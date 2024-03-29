import Foundation

class GameModuleViewModel: ObservableObject {
    @Published var isGameCompleted: Bool = false
    @Published var isConfirmationPopupPresented: Bool = false
    
    private let gameSource: GameSource
    private weak var delegate: GameModuleDelegate?
    
    var description: String {
        switch gameSource {
        case .config(let config):
            "Game from Config for \(config.gameID)"
        case .pack(let pack):
            "Game for \(pack.title)"
        }
    }
    
    init(
        gameSource: GameSource,
        delegate: GameModuleDelegate
    ) {
        self.gameSource = gameSource
        self.delegate = delegate
    }
    
    // MARK: - Intents
    
    func viewDidSelectLeave() {
        isConfirmationPopupPresented = true
    }
    
    func viewDidConfirmLeaving() {
        delegate?.gameModuleDidComplete()
        isGameCompleted = true
    }
    
    func viewDidSelectDeeplink() {
        NotificationCenter.default.post(
            name: .onDeeplinkOpening,
            object: nil
        )
    }
}
