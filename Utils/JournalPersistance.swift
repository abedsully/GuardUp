import SwiftData
import SwiftUI

@Model
class JournalEntry: Identifiable {
    @Attribute var title: String
    @Attribute var content: String
    @Attribute var image: Data
    @Attribute var date: Date = Date()

    init(title: String, content: String, image: Data) {
        self.title = title
        self.content = content
        self.image = image
    }
}
