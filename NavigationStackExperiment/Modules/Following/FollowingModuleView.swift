import SwiftUI

struct FollowingModuleView: View {
    @Binding var path: NavigationPath
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
