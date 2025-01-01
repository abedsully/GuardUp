import SwiftUI

struct JournalComponentView: View {
    var journalTitle: String
    var journalImage: UIImage
    var journalContent: String
    var journalDate: Date
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                Image(uiImage: journalImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading) {
                    Text(journalTitle)
                        .font(.title3)
                        .lineLimit(1)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text(journalContent)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 8)
                }
                .multilineTextAlignment(.leading)
            }
            
            VStack(alignment: .trailing) {
                Text(journalDate, style: .date)
                    .font(.body)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
    }
}
