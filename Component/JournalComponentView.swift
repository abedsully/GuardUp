import SwiftUI

struct JournalComponentView: View {
    var journalTitle: String
    var journalContent: String
    var journalDate: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(journalTitle)
                .font(.title2)
                .lineLimit(1)
            
            Text(journalContent)
                .font(.body)
                .lineLimit(3)
                .foregroundColor(.secondary)
            
            Text(journalDate, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
    }
}
