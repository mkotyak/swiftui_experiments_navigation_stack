import SwiftUI

struct PackDetailsModuleView: View {
    @StateObject private var viewModel: PackDetailsModuleViewModel
    
    init(viewModel: StateObject<PackDetailsModuleViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HeaderView(title: "Pack Details")
            Spacer()
            Text("Pack: \(viewModel.packTitle)")
            Spacer()
            playButton
        }
        .padding()
    }
    
    private var playButton: some View {
        Button {
            viewModel.viewDidSelectPlay()
        } label: {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(.orange)
                .frame(height: 54)
                .frame(maxWidth: .infinity)
                .overlay {
                    Text("Play")
                        .font(.subheadline)
                        .minimumScaleFactor(0.4)
                        .padding(.horizontal, 8)
                }
        }
    }
}
