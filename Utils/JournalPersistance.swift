import SwiftData

@Model
class JournalEntry {
    @Attribute var title: String
    @Attribute var content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
