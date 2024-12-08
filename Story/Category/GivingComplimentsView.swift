import SwiftUI

struct GivingComplimentsView: View {
    @State private var currentStoryIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var isCorrectAnswer: Bool? = nil
    @State private var showReflection = false
    
    private var stories: [GivingComplimentsConstant] {
        [
            GivingComplimentsConstant(text: "Devano (blue-hair boy), a friendly and outgoing student, notices Mario (red-hair boy) sitting alone on a bench, absorbed in his phone and looking withdrawn. Feeling like a compliment could brighten his day, Devano decides to approach him.", image: "compliment-story-1"),
            
            GivingComplimentsConstant(text: "Devano takes a deep breath and decides to say something ...", image: "compliment-story-2"),
            
            GivingComplimentsConstant(text: "How should Devano start the conversation?", image: "compliment-story-1", answers: ["Hey, Mario, I love your smile, it really brightens the room!", "You're always lonely. Shame on you!"], trueAnswer: "Hey, Mario, I love your smile, it really brightens the room!"),
            
            GivingComplimentsConstant(image: isCorrectAnswer == true ? "compliment-story-3-true" : "compliment-story-3-false"),
            
            GivingComplimentsConstant(text: isCorrectAnswer == true ? "Mario looks up, surprised, but then smiles. He seems to relax a bit, sitting up straighter, and makes eye contact with Devano." : "Mario flinches at Devano’s words, visibly uncomfortable.", image: isCorrectAnswer == true ? "compliment-story-4-true" : "compliment-story-4-false"),
            
            GivingComplimentsConstant(text: isCorrectAnswer == true ? "Devano and Mario continue talking for a few minutes. Mario seems comfortable now, and the mood has lightened." : "Mario feels sad and immediately gets away from the room", image: isCorrectAnswer == true ? "compliment-story-5-true" : "compliment-story-5-false")
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
                        ReflectionScreenView(isCorrectAnswer: $isCorrectAnswer, onRepeatButtonTapped: {
                            currentStoryIndex = 0
                            selectedAnswer = nil
                            isCorrectAnswer = nil
                            showReflection = false
                        }, correctTitleText: "Great job! You made Mario feel appreciated", incorrectTitleText: "Oh no! Mario didn’t feel great about what you said earlier", correctAnswerText: "Your compliments and empathy helped create a positive connection. Small gestures like this can make a big difference in someone's day!", incorrectAnswerText: "It seems like your words didn’t have the best effect. Even if you didn’t mean to, negative comments can make someone feel worse or even push them away. Think about how your words can make others feel next time.", imageUrl: isCorrectAnswer == true ? "compliment-reflection-true" : "compliment-reflection-false")
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
        if currentStoryIndex == 2 {
            isCorrectAnswer = selectedAnswer == stories[2].trueAnswer
        }
        
        if currentStoryIndex == stories.count - 1 {
            showReflection = true
        } else {
            currentStoryIndex = (currentStoryIndex + 1) % stories.count
        }
        
        selectedAnswer = nil
    }
}
