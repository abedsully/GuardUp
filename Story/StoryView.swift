import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            VStack {
                StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                
                StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                
                StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
            }
            .padding(24)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}
