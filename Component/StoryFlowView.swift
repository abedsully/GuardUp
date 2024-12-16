import SwiftUI

struct StoryFlowView: View {
    var guideText: String?
    var imageUrl: String?
    var answerLists: [String]?
    @Binding var selectedAnswer: String?
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            if let text = guideText {
                Text(text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Colors.customOrange)
            }
            
            if let imageUrl = imageUrl {
                VStack {
                    Image(imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.6)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.vertical, 16)
                
            }
            
            if let answers = answerLists {
                VStack(spacing: 16) {
                    ForEach(answers, id: \.self) { answer in
                        Button(action: {
                            selectedAnswer = answer
                        }) {
                            HStack {
                                Text(answer)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(
                                        Colors.customOrange
                                            .opacity(0.7)
                                    )
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }
            }
        }
        .padding(24)
        
    }
}
