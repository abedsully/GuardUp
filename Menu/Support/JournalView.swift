import SwiftUI
import SwiftData

struct JournalView: View {
    @Environment(\.modelContext) private var context
    @Query private var entries: [JournalEntry]
    
    @State private var isPresentingInputView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.title2)
                            Text(entry.content)
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: deleteEntry)
                }
                .listStyle(.plain)
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
    
    private func deleteEntry(at offsets: IndexSet) {
        for index in offsets {
            context.delete(entries[index])
        }
    }
}
