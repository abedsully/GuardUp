import SwiftUI

struct StoryBackNavigationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                StoryView()
            } label: {
                Image(systemName: "return")
                    .resizable()
                    .padding(16)
                    .frame(width: 72, height: 72)
                    .foregroundStyle(.white)
                    .background(Colors.customOrange.opacity(0.8))
                    .clipShape(Circle())

            }
        }
        .padding(.vertical, 36)
    }
}
