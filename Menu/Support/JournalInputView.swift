import SwiftUI
import SwiftData

struct JournalInputView: View {
    @Environment(\.modelContext) private var context
    @Binding var isPresenting: Bool
    
    @State private var newTitle: String = ""
    @State private var newContent: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $newTitle)
                }
                Section(header: Text("Content")) {
                    TextField("Enter content", text: $newContent, axis: .vertical)
                        .lineLimit(5)
                }
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresenting = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveEntry()
                    }
                    .disabled(newTitle.isEmpty || newContent.isEmpty)
                }
            }
        }
    }
    
    private func saveEntry() {
        let entry = JournalEntry(title: newTitle, content: newContent)
        context.insert(entry)
        isPresenting = false
    }
}
