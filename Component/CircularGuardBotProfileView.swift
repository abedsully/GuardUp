import SwiftUI

enum ProfileImageSize {
    case small
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small:
            return 60
        case .large:
            return 72
        }
    }
}

struct CircularGuardBotProfileView: View {
    var profileImageString: String
    let size: ProfileImageSize
    
    var body: some View {
        Image(profileImageString)
            .resizable()
            .scaledToFill()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
    }
}
