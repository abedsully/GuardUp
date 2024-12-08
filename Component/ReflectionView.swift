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
            
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
            
            HStack {
                if let isCorrectAnswer = isCorrectAnswer {
                    if isCorrectAnswer {
                        NavigationLink(destination: StoryView()) {
                            Text("Go to Story")
                                .padding()
                                .background(Colors.customOrange)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                
                
                Button(action: onRepeatButtonTapped) {
                    Text("Repeat")
                        .padding()
                        .background(Colors.customOrange)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
        }
        .padding(24)
        .background(Colors.customYellow.opacity(0.8), in: RoundedRectangle(cornerRadius: 20))
        .padding(36)
    }
}
