import SwiftUI

struct MenuBackNavigationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                MenuView()
            } label: {
                Image(systemName: "house")
                    .resizable()
                    .padding(16)
                    .frame(width: 72, height: 72)
                    .foregroundStyle(.black)
                    .background(Color.white)
                    .clipShape(Circle())

            }
        }
        .padding(.vertical, 36)
    }
}
