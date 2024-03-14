import SwiftUI

struct OtherProfileModuleView: View {
    @StateObject private var viewModel: OtherProfileModuleViewModel

    init(viewModel: StateObject<OtherProfileModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack {
            HeaderView(displayName: viewModel.displayName)
            InfoView()
            FollowCountView(
                followers: viewModel.followers,
                following: viewModel.following
            )
            EditButton()
            PostsListView()
        }
        .navigationTitle(viewModel.userName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
