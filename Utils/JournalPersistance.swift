import SwiftData
import SwiftUI

@Model
class JournalEntry {
    @Attribute var title: String
    @Attribute var content: String
    @Attribute var image: Data

    init(title: String, content: String, image: Data) {
        self.title = title
        self.content = content
        self.image = image
    }
}
