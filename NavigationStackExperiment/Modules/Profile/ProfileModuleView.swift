import SwiftUI

struct ProfileModuleView: View {
    @StateObject private var viewModel: ProfileModuleViewModel

    init(viewModel: StateObject<ProfileModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        VStack {
            HeaderView(displayName: viewModel.displayName)
            InfoView()
            FollowCountView(
                followersCount: viewModel.followersCount,
                followingCount: viewModel.followingCount
            )
            EditButton()
            PostsListView()
        }
    }
}
