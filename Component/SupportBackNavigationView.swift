import SwiftUI

struct SupportBackNavigationView: View {
    var color: Color
    
    var body: some View {
        VStack {
            NavigationLink {
                SupportView()
            } label: {
                Image(systemName: "return.right")
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
