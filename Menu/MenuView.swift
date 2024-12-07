import SwiftUI
import CoreData

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg3")
                    .resizable()
                    .frame(height: .infinity)
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack (alignment: .center, spacing: 16){
                    Spacer()
                    
                    Image("logo-2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                    
                    Spacer()
                    
                    VStack (alignment: .center, spacing: 40){
                        NavigationLink { 
                            StoryView()
                        } label: { 
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.1)
                            
                            
                        }
                                             
                        NavigationLink { 
                            StoryView()
                        } label: { 
                            Image("quiz-button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.1)
                            
                            
                        }
                        
                        
                        NavigationLink { 
                            StoryView()
                        } label: { 
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.1)
                            
                            
                        }
                        
                        
                        NavigationLink { 
                            StoryView()
                        } label: { 
                            Image("story-button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.1)
                            
                            
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
