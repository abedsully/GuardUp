import SwiftUI

struct StoryCategoryView: View {
    var imageUrl: String;
    var categoryTitle: String;
    var categoryDescription: String;
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 24) {
                Text(categoryTitle)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(categoryDescription)
                    .font(.callout)
            } 
        }
        .padding(.vertical, 24)
    }
}
