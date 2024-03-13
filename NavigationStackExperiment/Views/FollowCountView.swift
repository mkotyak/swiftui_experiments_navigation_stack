import SwiftUI

struct FollowCountView: View {
    let followersCount: Int
    let followingCount: Int

    var body: some View {
        HStack {
            Spacer()
            followersCountView
            Spacer()
            followingCountView
            Spacer()
        }
    }

    private var followersCountView: some View {
        NavigationLink(value: Route.followers) {
            VStack {
                Text("\(followersCount)")
                Text("Followers")
            }
            .foregroundStyle(.black)
        }
    }

    private var followingCountView: some View {
        NavigationLink(value: Route.following) {
            VStack {
                Text("\(followersCount)")
                Text("Following")
            }
            .foregroundStyle(.black)
        }
    }
}
