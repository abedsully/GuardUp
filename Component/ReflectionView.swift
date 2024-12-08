import SwiftUI

struct ReflectionScreenView: View {
    @Binding var isCorrectAnswer: Bool?
    var onRepeatButtonTapped: () -> Void
    var correctTitleText: String
    var incorrectTitleText: String
    var correctAnswerText: String
    var incorrectAnswerText: String
    var imageUrl: String
    
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
                if isCorrectAnswer {
                    Text(correctAnswerText)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else {
                    Text(incorrectAnswerText)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
            
            HStack (alignment: .center, spacing: 16){
                if let isCorrectAnswer = isCorrectAnswer {
                    if isCorrectAnswer {
                        StoryBackNavigationView()
                    }
                }
                
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
            }
            .padding(.top, 20)
        }
        .padding(24)
        .background(Colors.customYellow.opacity(0.8), in: RoundedRectangle(cornerRadius: 20))
        .padding(36)
    }
}
