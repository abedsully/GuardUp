import SwiftUI

struct RecognizingBullyingView: View {
    @State private var currentStoryIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var isCorrectFlow: Bool? = nil
    @State private var isCorrectAnswer: Bool? = nil
    @State private var showReflection = false
    
    @StateObject private var mediaPlayer = MediaPlayer()
    
    private var stories: [Story] {
        [
            Story(text: "Devano notices Mario standing alone in the cafeteria, looking down. Devano overhears some students laughing and pointing at Mario, and he starts to wonder if Mario is being teased.", image: "recognizing-story-1"),
            
            Story(text: "Devano approaches Mario, who quickly looks up, but Devano notices that Mario looks uncomfortable. The group of students is still laughing nearby.", image: "recognizing-story-2", answers: [
                "Ask Mario if he is okay and needs to be accompanied",
                "Ignore the situation and continue with his day."
            ], trueAnswer: "Ask Mario if he is okay and needs to be accompanied"),
            
            Story(image: isCorrectFlow == true ? "recognizing-story-3-true" : "recognizing-story-3-false"),
            
            Story(text: isCorrectFlow == true ?
                "Mario opens up to Devano, sharing that he feels humiliated by the students laughing at him. Devano offers his support, making Mario feel less isolated." :
                "Mario feels even more self-conscious after Devano ignores the situation, and the group continues to make fun of him. He feels even more alone.", image: isCorrectFlow == true ? "recognizing-story-4-true" : "recognizing-story-4-false"),
            
            Story(text: "Devano realizes that Mario is a victim of bullying. He wonders what steps he can take to help. What should he do next?", image: isCorrectFlow == true ? "recognizing-story-5-true" : "recognizing-story-4-false", answers: [
                "Talk to a teacher or counselor about the bullying.",
                "Tell Mario to just ignore the students and carry on."
            ], trueAnswer: "Talk to a teacher or counselor about the bullying."),
            
            Story(image: isCorrectAnswer == true ? "recognizing-story-6-true" : "recognizing-story-6-false"),
            
            Story(text: isCorrectAnswer == true ?
                "Devano talks to a teacher about what he’s noticed, and they work together to address the bullying. Mario feels relieved, and the bullying stops. Devano feels proud of taking action." :
                "Mario continues to suffer in silence as the bullying escalates. Devano regrets not doing more and wishes he’d taken action sooner.", image: isCorrectAnswer == true ? "recognizing-story-7-true" : "recognizing-story-7-false")
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
                                isCorrectFlow = nil
                                isCorrectAnswer = nil
                                showReflection = false
                            },
                            correctTitleText: "Great job, you helped Mario feel seen and supported.",
                            incorrectTitleText: "Oops, Mario feels more isolated now.",
                            correctAnswerText: "By recognizing the signs of bullying and taking action, you showed Mario that someone cares. Your support can break the cycle of isolation and help him feel safe. You took the first step in standing up for what’s right, which is crucial in stopping bullying and making others feel valued.",
                            incorrectAnswerText: "Ignoring bullying can cause people to feel even more alone and rejected. Mario may now feel that no one cares, and the bullying could escalate. It’s important to intervene and speak out against bullying—your actions have the power to make a real difference in someone’s life.",
                            imageUrl: isCorrectAnswer == true ? "compliment-reflection-true" : "compliment-reflection-false",
                            mediaPlayer: mediaPlayer
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
                    MediaPlayer.shared.playSoundEffect(forFileName: "click-sound-effect", forFormatIn: "wav", vol: 3)
                }
            }
            .simultaneousGesture(TapGesture().onEnded {
                if selectedAnswer != nil || stories[currentStoryIndex].answers == nil {
                    MediaPlayer.shared.playSoundEffect(forFileName: "click-sound-effect", forFormatIn: "wav", vol: 3)
                    checkAnswerAndMoveNext()
                }
            })
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            MediaPlayer.shared.stopOngoingMusic()
            if let storyText = stories[currentStoryIndex].text {
                mediaPlayer.speak(sound: storyText)
            }
        }
        .onChange(of: currentStoryIndex) { oldValue, newValue in
            if let storyText = stories[currentStoryIndex].text {
                mediaPlayer.speak(sound: storyText)
            }
        }
    }
    
    private func checkAnswerAndMoveNext() {
        if currentStoryIndex == 1 {
            isCorrectFlow = selectedAnswer == stories[1].trueAnswer
        }
        
        if currentStoryIndex == 4 {
            isCorrectAnswer = selectedAnswer == stories[4].trueAnswer
        }
        
        if currentStoryIndex == stories.count - 1 {
            showReflection = true
        } else {
            currentStoryIndex = (currentStoryIndex + 1) % stories.count
        }
        
        selectedAnswer = nil
    }
}
