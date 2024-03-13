import SwiftUI

struct ProfileModuleView: View {
    @StateObject private var viewModel: ProfileModuleViewModel

    init(viewModel: StateObject<ProfileModuleViewModel>) {
        self._viewModel = viewModel
    }

    var body: some View {
        NavigationStack(path: $viewModel.path) {
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
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .followers:
                    FollowersModuleView(followers: viewModel.followers)
                case .following:
                    FollowingModuleView(following: viewModel.following)
                }
            }
        }
    }
}
