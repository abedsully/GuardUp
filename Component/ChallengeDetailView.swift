import SwiftUI

struct ChallengeDetailView: View {
    @EnvironmentObject var viewModel: ChallengeViewModel
    @Environment(\.dismiss) var dismiss
    var challenge: Challenge
    @State private var isFinished: Bool

    init(challenge: Challenge) {
        self.challenge = challenge
        _isFinished = State(initialValue: challenge.isAvailable)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 24) {
                Text(challenge.titleText)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Image(challenge.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 450, height: 550)
                    .opacity(isFinished ? 0.8 : 1)
                
                Text(challenge.detail)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    isFinished.toggle()
                    viewModel.markChallengeAsCompleted(id: challenge.id)
                    MediaPlayer.shared.playSoundEffect(forFileName: "challenge_completed", forFormatIn: "wav", vol: 2)
                    dismiss()
                } label: {
                    Image("checklist-button")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                }

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image("close-button")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .padding(.top, 24)
                    }
                }
            }
            .padding(.top, 48)
        }
    }
}
