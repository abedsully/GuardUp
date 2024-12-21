import SwiftUI

struct JournalComponentView: View {
    var journalTitle: String
    var journalContent: String
    var journalImage: UIImage
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(uiImage: journalImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(journalTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(journalContent)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(Color.cyan)
        .foregroundStyle(.black)
        .cornerRadius(8)
    }
}
