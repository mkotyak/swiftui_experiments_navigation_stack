import Foundation

final class PackDetailsModuleViewModel: ObservableObject {
    @Published private var model: PackDetailsModuleModel
    private weak var delegate: PackDetailsModuleDelegate?

    var packTitle: String {
        model.pack.title
    }

    init(
        model: PackDetailsModuleModel,
        delegate: PackDetailsModuleDelegate
    ) {
        self.model = model
        self.delegate = delegate
    }

    // MARK: - Intents

    func viewDidSelectPlay() {
        delegate?.packDetailsModuleDidSelectStartGame()
    }
}
