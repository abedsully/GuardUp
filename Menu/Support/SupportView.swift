import SwiftUI

struct SupportView: View {
    var body: some View {
        NavigationView {
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
                        VStack (alignment: .center, spacing: 8){
                            Image("journal-logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                            
                            Text("My Journal")
                                .foregroundStyle(.black)
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        VStack (alignment: .center, spacing: 8){
                            Image("resource-logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                            
                            Text("Resources")
                                .foregroundStyle(.black)
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .padding(.vertical, 24)
                    
                    VStack (alignment: .center, spacing: 8){
                        Image("journal-logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                        
                        Text("My Journal")
                            .foregroundStyle(.black)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
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

