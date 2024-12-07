import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("story-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(height: .infinity)
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack (alignment: .center, spacing: 36){
                    Spacer()
                    
                    NavigationLink {
                        ComplimentView()
                    } label: {
                        StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                    }
                    
                    NavigationLink {
                        ComplimentView()
                    } label: {
                        StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                    }
                    
                    NavigationLink {
                        ComplimentView()
                    } label: {
                        StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                    }
                    
                    NavigationLink {
                        ComplimentView()
                    } label: {
                        StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                    }
                    
                    VStack {
                        NavigationLink {
                            MenuView()
                        } label: {
                            MenuBackNavigationView()
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}
