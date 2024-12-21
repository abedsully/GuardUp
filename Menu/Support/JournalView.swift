import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(\.modelContext) private var context
    @Query private var entries: [JournalEntry]

    @State private var isPresentingInputView: Bool = false

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(entries) { entry in
                        VStack(alignment: .leading) {
                            if let uiImage = UIImage(data: entry.image) {
                                JournalComponentView(
                                    journalTitle: entry.title,
                                    journalContent: entry.content,
                                    journalImage: uiImage
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Journal")
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
        .sheet(isPresented: $isPresentingInputView) {
            JournalInputView(isPresenting: $isPresentingInputView)
        }
        .navigationViewStyle(.stack)
    }
}
