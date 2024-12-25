import SwiftUI

struct JournalDetailView: View {
    let details: JournalEntry
    
    var body: some View {
        VStack(spacing: 16) {
            Text(details.title)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            if let uiImage = UIImage(data: details.image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            
            Text(details.content)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Journal Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
