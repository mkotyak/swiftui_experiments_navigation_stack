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
                    followers: viewModel.followers,
                    following: viewModel.following
                )
                EditButton()
                PostsListView()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case let .followers(followers):
                    FollowersModuleView(path: $viewModel.path, followers: followers)
                case let .following(following):
                    FollowingModuleView(path: $viewModel.path, following: following)
                case let .otherProfile(user):
                    OtherProfileModuleView(
                        viewModel: StateObject(wrappedValue: OtherProfileModuleViewModel(
                            model: OterProfileModuleModel(otherUser: user)
                        ))
                    )
                }
            }
        }
    }
}
