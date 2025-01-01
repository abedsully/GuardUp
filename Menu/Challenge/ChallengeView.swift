import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject var viewModel: ChallengeViewModel
    @State private var selectedChallenge: Challenge?
    @State private var showToast = false
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("challenge-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 16){
                        Spacer()
                        
                        Image("challenge-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height * 0.25)
                        
                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(viewModel.challenges) { challenge in
                                Button {
                                    if challenge.isAvailable {
                                        selectedChallenge = challenge
                                    }
                                } label: {
                                    VStack (alignment: .center, spacing: 16){
                                        Image(challenge.isAvailable ? challenge.imageUrl : challenge.imageUrlLocked)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 160, height: 180)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .opacity(challenge.isAvailable ? 1 : 0.5)
                                        
                                        Text(challenge.isAvailable ? challenge.titleText : "")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(Color.white)
                                    }
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity)
                                }
                                .disabled(!challenge.isAvailable)
                                
                            }
                        }
                        .padding(.horizontal, 36)
                        .padding(.top, 36)
                        
                        VStack {
                            NavigationLink {
                                MenuView()
                            } label: {
                                MenuBackNavigationView(color: Colors.customBlue)
                            }
                        }
                    }
                    .padding(24)
                    .padding(.horizontal, 36)
                }
                
            }
            .fullScreenCover(item: $selectedChallenge) { challenge in
                ChallengeDetailView(challenge: challenge)
                    .onDisappear {
                        if let challenge = selectedChallenge {
                            viewModel.markChallengeAsCompleted(id: challenge.id)
                        }
                    }
            }
            
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        .onAppear {
            MediaPlayer.shared.playMusic(forFileName: "secondary_music", forFormatIn: "mp3", vol: 1)
        }
    }
}
