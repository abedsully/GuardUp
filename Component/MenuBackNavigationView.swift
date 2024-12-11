import SwiftUI

struct MenuBackNavigationView: View {
    var color: Color
    
    var body: some View {
        VStack {
            NavigationLink {
                MenuView()
            } label: {
                Image(systemName: "house.fill")
                    .resizable()
                    .padding(16)
                    .frame(width: 72, height: 72)
                    .foregroundStyle(.black)
                    .background(color.opacity(0.8))
                    .clipShape(Circle())
                
            }
        }
        .padding(.vertical, 36)
    }
}
