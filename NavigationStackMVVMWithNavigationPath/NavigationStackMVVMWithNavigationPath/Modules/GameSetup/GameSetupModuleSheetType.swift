import Foundation

enum GameSetupModuleSheetType: Identifiable {
    var id: String {
        switch self {
        case .packDetails(let pack):
            "packDetails \(pack.id)"
        }
    }

    case packDetails(pack: Pack)
}
