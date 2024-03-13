import SwiftUI

struct FollowersModuleView: View {
    let followers: [User]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(followers) { user in
                    UserRow(user: user)
                }
            }
            .padding(.top)
        }
    }
}
