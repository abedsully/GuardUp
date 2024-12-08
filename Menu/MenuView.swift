import SwiftUI
import CoreData

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
                            
                            
                        }
                        
                        NavigationLink {
                            StoryView()
                        } label: {
                            Image("quiz-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                            
                            
                        }
                        
                        
                        NavigationLink {
                            StoryView()
                        } label: {
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                            
                            
                        }
                        
                        
                        NavigationLink {
                            StoryView()
                        } label: {
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 0.1)
                            
                            
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
