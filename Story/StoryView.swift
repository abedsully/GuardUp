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
                            ProvidingSupportView()
                        } label: {
                            StoryCategoryView(imageUrl: "support-logo", categoryTitle: "Providing Support", categoryDescription: "Learn how to boost someone's confidence and brighten their day by offering geuine support.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                        
                        NavigationLink {
                            ShowingSympathyView()
                        } label: {
                            StoryCategoryView(imageUrl: "sympathy-logo", categoryTitle: "Showing Sympathy", categoryDescription: "Learn the power of showing sympathy by understanding others' feelings and perspectives.")
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 36)
                        }
                        
                        
                        NavigationLink {
                            RecognizingBullyingView()
                        } label: {
                            StoryCategoryView(imageUrl: "recognizing-bullying-logo", categoryTitle: "Recognizing Bullying", categoryDescription: "Learn how to identify the signs of bullying—whether it's verbal, physical, or emotional —and taking necessary steps to support those affected.")
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
