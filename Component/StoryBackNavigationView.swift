import SwiftUI

struct StoryBackNavigationView: View {
    @ObservedObject var mediaPlayer = MediaPlayer()
    
    var body: some View {
        VStack {
            NavigationLink {
                StoryView()
            } label: {
                Image(systemName: "return.right")
                    .resizable()
                    .padding(16)
                    .frame(width: 72, height: 72)
                    .foregroundStyle(.white)
                    .background(Colors.customOrange.opacity(0.8))
                    .clipShape(Circle())
            }.simultaneousGesture(TapGesture().onEnded {
                mediaPlayer.stopSpeaking()
            })
        }
        .padding(.vertical, 36)
    }
}
