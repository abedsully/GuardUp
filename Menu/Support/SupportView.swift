import SwiftUI

struct SupportView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("support-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                VStack {
                    Spacer()
                    
                    Image("support-menu-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                        .padding(.top, 16)
                    
                    Spacer()
                    
                    HStack (alignment: .center, spacing: 32) {
                        
                        NavigationLink {
                            JournalView()
                        } label: {
                            VStack (alignment: .center, spacing: 16){
                                Image("journal-logo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("My Journal")
                                    .foregroundStyle(.black)
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }
                            .padding(24)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        NavigationLink {
                            ResourcesView()
                        } label: {
                            VStack (alignment: .center, spacing: 16){
                                Image("resource-logo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text("Resources")
                                    .foregroundStyle(.black)
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }
                            .padding(24)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .padding(.vertical, 24)
                    
                    Spacer()
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink {
                            MenuView()
                        } label: {
                            MenuBackNavigationView(color: Colors.customGreen)
                        }
                    }
                }
                
            }
            
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        .onAppear {
            MediaPlayer.shared.stopOngoingMusic()
        }
    }
}

