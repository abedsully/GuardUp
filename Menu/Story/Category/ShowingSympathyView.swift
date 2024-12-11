import SwiftUI

struct ShowingSympathyView: View {
    @State private var currentStoryIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var isCorrectAnswer: Bool? = nil
    @State private var showReflection = false
    
    private var stories: [Story] {
        [
            Story(text: "Devano sees Mario standing outside his house, looking overwhelmed. He notices the flood damage and the sadness in Mario’s eyes.", image: "sympathy-story-1"),
            
            Story(text: "Devano gets closer Mario and decides to say something ...", image: "sympathy-story-2", answers: ["You’re not alone, Mario. I’m here for you, whenever you need.", "It’s just a house, Mario. Don't even worry about it"], trueAnswer: "You’re not alone, Mario. I’m here for you, whenever you need."),
            
            Story(image: isCorrectAnswer == true ? "sympathy-story-3-true" : "sympathy-story-3-false"),
            
            Story(text: isCorrectAnswer == true ? "Mario feels comforted and not as alone. He’s grateful for Devano’s sympathy." : "Mario feels dismissed and even more isolated. He wished Devano understood more.", image: isCorrectAnswer == true ? "sympathy-story-4-true" : "sympathy-story-4-false"),
            
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.customYellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                
                
                VStack {
                    if showReflection {
                        ReflectionScreenView(
                            isCorrectAnswer: $isCorrectAnswer,
                            onRepeatButtonTapped: {
                                currentStoryIndex = 0
                                selectedAnswer = nil
                                isCorrectAnswer = nil
                                showReflection = false
                            },
                            correctTitleText: "Great! You understood the importance of sympathy.",
                            incorrectTitleText: "Oops! That response missed the mark.",
                            correctAnswerText: "Sympathy involves deeply understanding and sharing the feelings of another person. It's about connecting with them emotionally and offering support in meaningful ways. Keep practicing sympathy, and you’ll build stronger, more supportive relationships.",
                            incorrectAnswerText: "Sympathy is an important first step in showing that you care. It allows you to acknowledge someone’s pain and offer comfort. However, it’s important to be mindful of how we express sympathy—simply feeling sorry for someone can sometimes feel distant or passive. To make your sympathy more impactful, try to offer support in ways that show you’re there for them, like offering help or a listening ear.",
                            imageUrl: isCorrectAnswer == true ? "compliment-reflection-true" : "compliment-reflection-false"
                        )

                    } else {
                        StoryFlowView(
                            guideText: stories[currentStoryIndex].text,
                            imageUrl: stories[currentStoryIndex].image,
                            answerLists: stories[currentStoryIndex].answers,
                            selectedAnswer: $selectedAnswer
                        )
                        .padding(.horizontal, 24)
                        
                        HStack {
                            ForEach(0..<stories.count, id: \.self) { index in
                                Circle()
                                    .fill(currentStoryIndex == index ? Colors.customOrange : Color.gray)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                }
                .padding(36)
            }
            .onChange(of: selectedAnswer) { oldValue, newValue in
                if newValue != nil {
                    checkAnswerAndMoveNext()
                }
            }
            .onTapGesture {
                if selectedAnswer != nil || stories[currentStoryIndex].answers == nil {
                    checkAnswerAndMoveNext()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
    
    private func checkAnswerAndMoveNext() {
        if currentStoryIndex == 1 {
            isCorrectAnswer = selectedAnswer == stories[1].trueAnswer
        }
        
        if currentStoryIndex == stories.count - 1 {
            showReflection = true
        } else {
            currentStoryIndex = (currentStoryIndex + 1) % stories.count
        }
        
        selectedAnswer = nil
    }
}
