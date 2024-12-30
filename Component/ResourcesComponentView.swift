import SwiftUI

struct ResourcesComponentView: View {
    var resource: Resource
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 16) {
                Image(resource.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                
                Text(resource.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("📞 Call Center: \(resource.callCenter)")
                    .font(.body)
                    .foregroundStyle(.gray)
                
                Text("☎️ Help Line: \(resource.helpLine)")
                    .font(.body)
                    .foregroundStyle(.gray)
                
                Link("🌐 Website", destination: URL(string: resource.website)!)
                    .font(.body)
                    .foregroundStyle(.blue)
            }
        }
        .frame(maxWidth: 500, alignment: .leading)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}
