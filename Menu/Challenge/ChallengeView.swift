import SwiftUI

struct ChallengeView: View {
    private var challengeList: [Challenge] {
        [
            Challenge(id: 1, imageUrl: "challenge-stand-up", titleText: "Stand Up", detail: "When you see someone being bullied, speak up and let the bully know that their behavior is not acceptable."),
            Challenge(id: 2, imageUrl: "compliment-logo", titleText: "Give Compliment", detail: "Give a genuine compliment to someone who might not get enough praise or attention."),
            Challenge(id: 3, imageUrl: "compliment-logo", titleText: "Share Positivity", detail: "Share something positive or uplifting to help spread kindness."),
            Challenge(id: 4, imageUrl: "compliment-logo", titleText: "Support Friend", detail: "Be there for a friend who is being bullied, offer them support and help them find a solution."),
            Challenge(id: 5, imageUrl: "compliment-logo", titleText: "Stop Gossip", detail: "Stand up against gossip, and encourage others to talk respectfully about others."),
            Challenge(id: 6, imageUrl: "compliment-logo", titleText: "Speak Out", detail: "Speak out against bullying whenever you see it happening, and encourage others to do the same."),
            Challenge(id: 7, imageUrl: "compliment-logo", titleText: "Spread Kindness", detail: "Perform random acts of kindness to help create a more positive environment."),
            Challenge(id: 8, imageUrl: "compliment-logo", titleText: "Raise Awareness", detail: "Help raise awareness about bullying and encourage people to treat each other with kindness."),
            Challenge(id: 9, imageUrl: "compliment-logo", titleText: "Help Stranger", detail: "Reach out to someone who looks like they need help or company, and include them in your activities."),
            Challenge(id: 10, imageUrl: "compliment-logo", titleText: "Learn Empathy", detail: "Try to understand how others are feeling and treat them with compassion."),
            Challenge(id: 11, imageUrl: "compliment-logo", titleText: "Promote Respect", detail: "Encourage others to respect each other’s differences and treat everyone with kindness."),
            Challenge(id: 12, imageUrl: "compliment-logo", titleText: "Practice Patience", detail: "Take the time to listen to others and show understanding, especially when someone is struggling."),
        ]
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State private var selectedChallenge: Challenge?
    
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
                            ForEach(challengeList, id: \.id) { challenge in
                                Button {
                                    selectedChallenge = challenge
                                } label: {
                                    VStack (alignment: .center, spacing: 16){
                                        Image(challenge.imageUrl)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 160, height: 180)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                        
                                        Text(challenge.titleText)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.center)
                                    }
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity)
                                }
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
            .sheet(item: $selectedChallenge) { challenge in
                ChallengeDetailView(challenge: challenge)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}
