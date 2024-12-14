import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("menu-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack (alignment: .center, spacing: 16){
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.35)
                    
                    Spacer()
                    
                    VStack (alignment: .center, spacing: 40){
                        
                        NavigationLink {
                            StoryView()
                        } label: {
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                        }.simultaneousGesture(TapGesture().onEnded {
                            MediaPlayer.shared.playSoundEffect(forFileName: "mixkit_click", forFormatIn: "wav", vol: 3)
                        })
                        
                        NavigationLink {
                            QuizView()
                        } label: {
                            Image("quiz-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                        }.simultaneousGesture(TapGesture().onEnded {
                            MediaPlayer.shared.playSoundEffect(forFileName: "mixkit_click", forFormatIn: "wav", vol: 3)
                        })
                        
                        NavigationLink {
                            ChallengeView()
                        } label: {
                            Image("challenge-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                        }.simultaneousGesture(TapGesture().onEnded {
                            MediaPlayer.shared.playSoundEffect(forFileName: "mixkit_click", forFormatIn: "wav", vol: 3)
                        })
                        
                        
                        NavigationLink {
                            StoryView()
                        } label: {
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                        }.simultaneousGesture(TapGesture().onEnded {
                            MediaPlayer.shared.playSoundEffect(forFileName: "mixkit_click", forFormatIn: "wav", vol: 3)
                        })
                    }
                    Spacer()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            MediaPlayer.shared.playMusic(forFileName: "introduction_music", forFormatIn: "mp3", vol: 1)
        })
    }
}

