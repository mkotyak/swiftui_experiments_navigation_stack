import SwiftUI

struct FollowCountView: View {
    let followers: [User]
    let following: [User]

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
        NavigationLink(value: Route.followers(followers)) {
            VStack {
                Text("\(followers.count)")
                Text("Followers")
            }
            .foregroundStyle(.black)
        }
    }

    private var followingCountView: some View {
        NavigationLink(value: Route.following(following)) {
            VStack {
                Text("\(following.count)")
                Text("Following")
            }
            .foregroundStyle(.black)
        }
    }
}
