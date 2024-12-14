import SwiftUI

struct ProvidingSupportView: View {
    @State private var currentStoryIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var isCorrectAnswer: Bool? = nil
    @State private var showReflection = false
    
    private var stories: [Story] {
        [
            Story(text: "Devano opens his smartphone in his leisure times. He notices there are 2 new messages in his Messages App and decides to open it", image: "support-story-1"),
            
            Story(text: "Oohh, It's from Mario. Devano reads the messages and watches Mario's vlog ...", image: "support-story-2"),
            
            Story(text: "How should Devano react to the message?", image: "support-story-3", answers: ["Yo, this vlog is so good, it’s like you’re a natural-born star 😜", "I've seen more excitement in a tutorial on how to fold socks—seriously, where’s the energy? 😬"], trueAnswer: "Yo, this vlog is so good, it’s like you’re a natural-born star 😜"),
            
            Story(image: isCorrectAnswer == true ? "support-story-4-true" : "support-story-4-false"),
            
            Story(text: isCorrectAnswer == true ? "Mario is happy and he is even more excited to vlog again..." : "Mario seems sad and unappreciated", image: isCorrectAnswer == true ? "support-story-5-true" : "support-story-5-false"),
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
                        }, correctTitleText: "Awesome, you successfully make Mario feels supported", incorrectTitleText: "You fail, Mario feels miserable and unconfident about his vlogs", correctAnswerText: "Your support can make a huge difference in someone's life. By showing care and encouragement, you help build their confidence and motivation to succeed, just like Mario. A little support can go a long way in helping someone overcome doubts and pursue their goals.", incorrectAnswerText: "Without sympathy, people can feel isolated and misunderstood. Mario, like anyone, may struggle to cope with challenges without knowing others care. A small gesture of compassion can make a big difference in helping them feel seen and supported during tough times.", imageUrl: isCorrectAnswer == true ? "compliment-reflection-true" : "compliment-reflection-false")
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
        .onAppear {
            MediaPlayer.shared.playMusic(forFileName: "story-detail-music", forFormatIn: "mp3", vol: 1)
        }
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
