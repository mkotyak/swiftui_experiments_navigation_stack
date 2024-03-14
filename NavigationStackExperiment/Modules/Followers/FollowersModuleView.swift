import SwiftUI

struct FollowersModuleView: View {
    let followers: [User]

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
    }
}
