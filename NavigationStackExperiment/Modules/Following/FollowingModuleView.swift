import SwiftUI

struct FollowingModuleView: View {
    let following: [User]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(following) { user in
                    UserRow(user: user)
                }
            }
            .padding(.top)
        }
    }
}
