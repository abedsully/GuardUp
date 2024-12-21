import SwiftUI
import SwiftData
import Photos

struct JournalInputView: View {
    @Environment(\.modelContext) private var context
    @Binding var isPresenting: Bool

    @State private var newTitle: String = ""
    @State private var newContent: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $newTitle)
                }
                Section(header: Text("Content")) {
                    TextField("Enter content", text: $newContent, axis: .vertical)
                }
                Section(header: Text("Image")) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else {
                        Button("Select Image") {
                            isImagePickerPresented = true
                        }
                    }
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
                    .disabled(newTitle.isEmpty || newContent.isEmpty || selectedImage == nil)
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }
        }
    }

    private func saveEntry() {
        guard let selectedImage = selectedImage,
              let imageData = selectedImage.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let entry = JournalEntry(title: newTitle, content: newContent, image: imageData)
        context.insert(entry)
        isPresenting = false
    }
}
