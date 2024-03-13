import SwiftUI

struct PostsListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 10, id: \.self) { _ in
                    PostRow()
                }
            }
            .padding(.top)
        }
    }
}
