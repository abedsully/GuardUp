import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("story-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack (alignment: .center, spacing: 16) {
                    Spacer()
                    
                    Image("story-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.2)
                        .padding(.top, 16)
                    
                    VStack (alignment: .center, spacing: 8) {
                        NavigationLink {
                            GivingComplimentsView()
                        } label: {
                            StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                        
                        NavigationLink {
                            GivingComplimentsView()
                        } label: {
                            StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                        
                        NavigationLink {
                            GivingComplimentsView()
                        } label: {
                            StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                        
                        NavigationLink {
                            GivingComplimentsView()
                        } label: {
                            StoryCategoryView(imageUrl: "compliment-logo", categoryTitle: "Giving Compliments", categoryDescription: "Learn how simple, kind words can brighten someone’s day and build stronger connections with others.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                    }
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        NavigationLink {
                            MenuView()
                        } label: {
                            MenuBackNavigationView()
                        }
                    }
                }
                .padding(.horizontal, 96)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}
