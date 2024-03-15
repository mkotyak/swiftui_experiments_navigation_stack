import SwiftUI

struct FollowersModuleView: View {
    @StateObject private var viewModel: FollowersModuleViewModel
    private let followers: [User]

    init(
        viewModel: StateObject<FollowersModuleViewModel>,
        followers: [User]
    ) {
        self._viewModel = viewModel
        self.followers = followers
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(followers) { user in
                    NavigationLink(value: Route.otherProfile(user)) {
                        UserRow(user: user)
                    }
                }
            }
            .padding(.top)
        }
        .navigationTitle("Followers")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.viewDidSelectBack()
                } label: {
                    Image(systemName: "house")
                        .resizable()
                }
            }
        }
    }
}
