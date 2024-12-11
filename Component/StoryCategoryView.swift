import SwiftUI

struct StoryCategoryView: View {
    var imageUrl: String;
    var categoryTitle: String;
    var categoryDescription: String;
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                Image(imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(categoryTitle)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(categoryDescription)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(16)
            .background(Color.white)
            .cornerRadius(8)
            
        }
        .padding(8)
        .foregroundStyle(.black)
    }
}
