import SwiftUI

struct FollowersModuleView: View {
    @Binding var path: NavigationPath
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    path = .init()
                } label: {
                    Image(systemName: "house")
                        .resizable()
                }
            }
        }
    }
}
