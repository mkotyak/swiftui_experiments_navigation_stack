import SwiftUI

struct FollowingModuleView: View {
    let following: [User]

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
    }
}
