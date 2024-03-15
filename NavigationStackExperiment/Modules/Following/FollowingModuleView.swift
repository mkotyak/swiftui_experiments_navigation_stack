import SwiftUI

struct FollowingModuleView: View {
    @StateObject private var viewModel: FollowingModuleViewModel
    private let following: [User]

    init(
        viewModel: StateObject<FollowingModuleViewModel>,
        following: [User]
    ) {
        self._viewModel = viewModel
        self.following = following
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(following) { user in
                    NavigationLink(value: Route.otherProfile(user)) {
                        UserRow(user: user)
                    }
                }
            }
            .padding(.top)
        }
        .navigationTitle("Following")
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
