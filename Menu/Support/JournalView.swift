import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.date, order: .reverse) private var entries: [JournalEntry]
    
    @State private var isPresentingInputView: Bool = false
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
                
                ScrollView {
                    Image("my-journal-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(entries) { entry in
                            NavigationLink(destination: JournalDetailView(details: entry)) {
                                JournalComponentView(
                                    journalTitle: entry.title,
                                    journalContent: entry.content,
                                    journalDate: entry.date
                                )
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.horizontal, 64)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isPresentingInputView = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentingInputView) {
            JournalInputView(isPresenting: $isPresentingInputView)
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}

