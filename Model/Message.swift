import Foundation

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isFromUser: Bool
}
