struct Challenge: Identifiable, Hashable {
    let id: Int
    let imageUrl: String
    let imageUrlLocked: String
    let titleText: String
    let detail: String
    var isAvailable: Bool
}
