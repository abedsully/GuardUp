import SwiftUI

struct ChallengeDetailView: View {
    @Environment(\.dismiss) var dismiss
    var challenge: Challenge
    
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
                
                Text(challenge.detail)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Button {
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
                    }
                    .padding(.top, 8)
                    
                }
            }
        }
    }
}
