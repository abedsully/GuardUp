import SwiftUI

struct ReflectionScreenView: View {
    @Binding var isCorrectAnswer: Bool?
    var onRepeatButtonTapped: () -> Void
    var correctTitleText: String
    var incorrectTitleText: String
    var correctAnswerText: String
    var incorrectAnswerText: String
    var imageUrl: String
    @StateObject private var mediaPlayer = MediaPlayer()
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isCorrectAnswer == true ? correctTitleText : incorrectTitleText)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
            
            if let isCorrectAnswer = isCorrectAnswer {
                Text(isCorrectAnswer ? correctAnswerText : incorrectAnswerText)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            HStack (alignment: .center, spacing: 16){
                
                Button {
                    onRepeatButtonTapped()
                } label: {
                    Image(systemName: "repeat")
                        .resizable()
                        .padding(16)
                        .frame(width: 72, height: 72)
                        .foregroundStyle(.white)
                        .background(Colors.customOrange.opacity(0.8))
                        .clipShape(Circle())
                }
                
                if let isCorrectAnswer = isCorrectAnswer {
                    if isCorrectAnswer {
                        StoryBackNavigationView()
                    }
                }
            }
            .padding(.top, 20)
        }
        .padding(24)
        .background(Colors.customYellow.opacity(0.8), in: RoundedRectangle(cornerRadius: 20))
        .padding(36)
        .onAppear {
            MediaPlayer.shared.playSoundEffect(forFileName: isCorrectAnswer == true ? "winning" : "losing", forFormatIn: "wav", vol: 2)
            mediaPlayer.speak(sound: "\(isCorrectAnswer == true ? correctTitleText : incorrectTitleText)")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                mediaPlayer.speak(sound: "\(isCorrectAnswer == true ? correctAnswerText : incorrectAnswerText)")
            }
        }
    }
}
