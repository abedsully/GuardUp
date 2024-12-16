import SwiftUI

struct GuardBotView: View {
    @State private var initialMessage = "Hello There!! I'm Guard Bot, Your Personal Assistant Here! What can I do for you?"
    @State private var message = ""
    @ObservedObject var viewModel = GuardBotViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Divider()
                        .background(Color.gray)
                }
                .background(Color.blue)
                
                ZStack {
                    VStack {
                        ScrollView {
                            LazyVStack(spacing: 15) {
                                ForEach(viewModel.chatMessages) { message in
                                    messageView(message: message)
                                }
                            }
                            .padding(.top, 16)
                        }
                        .scrollIndicators(.never)
                        Spacer()
                    }
                    .padding([.leading, .trailing, .bottom])
                }
                
                Divider()
                    .background(Color.gray)
                
                HStack {
                    TextField("Type your message...", text: $message)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 30))
                        .background(Color.gray.opacity(0.2).cornerRadius(20))
                        .font(.body)
                    
                    Button(action: {
                        if !message.isEmpty {
                            viewModel.sendMessage(message)
                            viewModel.analyzeSentiment(message: message)
                            message = ""
                        }
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundStyle(.white)
                            .padding()
                            .background(Colors.customOrange)
                            .cornerRadius(20)
                            .padding(.leading, 10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
            }
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack (alignment: .center){
                        CircularGuardBotProfileView(profileImageString: "guard-bot-image", size: .large)
                        
                        Text("Guard Bot")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                    .padding(.top, 24)
                }
            }
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarBackground(.visible , for: .navigationBar)
        }
        .navigationViewStyle(.stack)
        .onAppear {
            MediaPlayer.shared.stopOngoingMusic()
            DispatchQueue.main.async {
                viewModel.chatMessages.append(Message(text: initialMessage, isFromUser: false))
                viewModel.mediaPlayer.speak(sound: initialMessage)
            }
        }
        .onDisappear {
            DispatchQueue.main.async {
                viewModel.mediaPlayer.stopSpeaking()
                viewModel.chatMessages.removeAll()
                MediaPlayer.shared.playMusic(forFileName: "introduction_music", forFormatIn: "mp3", vol: 1)
            }
        }
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.isFromUser {
                Spacer(minLength: 100)
            }
            
            VStack {
                if message.isFromUser {
                    Text(message.text)
                        .font(.title2)
                        .padding(12)
                        .background(Color.blue)
                        .clipShape(MessageBubble(isFromUser: true))
                        .foregroundStyle(.white)
                } else {
                    HStack(alignment: .bottom) {
                        CircularGuardBotProfileView(profileImageString: "guard-bot-image", size: .small)
                        
                        Text(message.text)
                            .font(.title2)
                            .padding(12)
                            .background(Color.yellow)
                            .clipShape(MessageBubble(isFromUser: false))
                            .foregroundStyle(.black)
                    }
                }
            }
            
            if !message.isFromUser {
                Spacer(minLength: 50)
            }
        }
        .padding(.horizontal)
    }
}
