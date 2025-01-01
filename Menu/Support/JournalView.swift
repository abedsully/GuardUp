import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.date, order: .reverse) private var entries: [JournalEntry]
    
    @State private var isPresentingInputView: Bool = false
    
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
                
                ScrollView {
                    VStack {
                        Button {
                            isPresentingInputView.toggle()
                        } label: {
                            Image("plus-sign-button")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                        }
                        .padding(.top, 32)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 32)

                    
                    Image("my-journal-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                    
                    Spacer()
                    
                    LazyVStack(spacing: 24) {
                        ForEach(entries) { entry in
                            NavigationLink(destination: JournalDetailView(details: entry)) {
                                if let uiImage = UIImage(data: entry.image) {
                                    JournalComponentView(
                                        journalTitle: entry.title,
                                        journalImage: uiImage,
                                        journalContent: entry.content,
                                        journalDate: entry.date
                                    )
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(36)
                    
                    VStack {
                        SupportBackNavigationView(color: Colors.customGreen)
                    }
                }
                .scrollIndicators(.never)
                .padding(.horizontal, 72)
            }
        }
        .sheet(isPresented: $isPresentingInputView) {
            JournalInputView(isPresenting: $isPresentingInputView)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        .onAppear {
            MediaPlayer.shared.stopOngoingMusic()
        }
    }
}

