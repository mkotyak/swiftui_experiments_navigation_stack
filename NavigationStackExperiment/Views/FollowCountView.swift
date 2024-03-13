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
        VStack {
            Text("\(followersCount)")
            Text("Followers")
        }
    }

    private var followingCountView: some View {
        VStack {
            Text("\(followersCount)")
            Text("Following")
        }
    }
}
