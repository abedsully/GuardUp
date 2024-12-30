import SwiftUI

struct Resource {
    let title: String
    let image: String
    let callCenter: String
    let textLine: String?
    let helpLine: String
    let website: String
}

struct ResourcesComponentView: View {
    var resourcesTitle: String
    var resourcesImage: String
    var callCenter: String
    var textLine: String?
    var helpLine: String
    var website: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 16) {
                Image(resourcesImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(resourcesTitle)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("📞 Call Center: \(callCenter)")
                    .font(.body)
                    .foregroundColor(.gray)
                
                if let text = textLine {
                    Text("✉️ Text Line: \(text)")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                
                Text("☎️ Help Line: \(helpLine)")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Link("🌐 Website", destination: URL(string: website)!)
                    .font(.body)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 2)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
