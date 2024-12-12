import SwiftUI

class ChallengeViewModel: ObservableObject {
    @Published var challenges: [Challenge]
    
    init() {
        self.challenges = [
            Challenge(id: 1, imageUrl: "challenge-stand-up", imageUrlLocked: "challenge-stand-up-locked", titleText: "Stand Up", detail: "When you see someone being bullied, speak up and let the bully know that their behavior is not acceptable.", isAvailable: ChallengePersistence.getChallengeState(for: 1)),
            Challenge(id: 2, imageUrl: "compliment-logo", imageUrlLocked: "challenge-give-compliment-locked", titleText: "Give Compliment", detail: "Give a genuine compliment to someone who might not get enough praise or attention.", isAvailable: ChallengePersistence.getChallengeState(for: 2)),
            Challenge(id: 3, imageUrl: "challenge-share-positivity", imageUrlLocked: "challenge-share-positivity-locked", titleText: "Share Positivity", detail: "Share something positive or uplifting to help spread kindness.", isAvailable: ChallengePersistence.getChallengeState(for: 3)),
            Challenge(id: 4, imageUrl: "challenge-support-friend", imageUrlLocked: "challenge-support-friend-locked", titleText: "Support Friend", detail: "Be there for a friend who is being bullied, offer them support and help them find a solution.", isAvailable: ChallengePersistence.getChallengeState(for: 4)),
            Challenge(id: 5, imageUrl: "challenge-stop-gossip", imageUrlLocked: "challenge-stop-gossip-locked", titleText: "Stop Gossip", detail: "Stand up against gossip, and encourage others to talk respectfully about others.", isAvailable: ChallengePersistence.getChallengeState(for: 5)),
            Challenge(id: 6, imageUrl: "challenge-speak-out", imageUrlLocked: "challenge-speak-out-locked", titleText: "Speak Out", detail: "Speak out against bullying whenever you see it happening, and encourage others to do the same.", isAvailable: ChallengePersistence.getChallengeState(for: 6)),
            Challenge(id: 7, imageUrl: "challenge-spread-kindness", imageUrlLocked: "challenge-spread-kindness-locked", titleText: "Spread Kindness", detail: "Perform random acts of kindness to help create a more positive environment.", isAvailable: ChallengePersistence.getChallengeState(for: 7)),
            Challenge(id: 8, imageUrl: "challenge-raise-awareness", imageUrlLocked: "challenge-raise-awareness-locked", titleText: "Raise Awareness", detail: "Help raise awareness about bullying and encourage people to treat each other with kindness.", isAvailable: ChallengePersistence.getChallengeState(for: 8)),
            Challenge(id: 9, imageUrl: "challenge-help-stranger", imageUrlLocked: "challenge-help-stranger-locked", titleText: "Help Stranger", detail: "Reach out to someone who looks like they need help or company, and include them in your activities.", isAvailable: ChallengePersistence.getChallengeState(for: 9)),
            Challenge(id: 10, imageUrl: "challenge-learn-empathy", imageUrlLocked: "challenge-learn-empathy-locked", titleText: "Learn Empathy", detail: "Try to understand how others are feeling and treat them with compassion.", isAvailable: ChallengePersistence.getChallengeState(for: 10)),
            Challenge(id: 11, imageUrl: "challenge-promote-respect", imageUrlLocked: "challenge-promote-locked", titleText: "Promote Respect", detail: "Encourage others to respect each other’s differences and treat everyone with kindness.", isAvailable: ChallengePersistence.getChallengeState(for: 11)),
            Challenge(id: 12, imageUrl: "challenge-practice-patience", imageUrlLocked: "challenge-practice-patience-locked", titleText: "Practice Patience", detail: "Take the time to listen to others and show understanding, especially when someone is struggling.", isAvailable: ChallengePersistence.getChallengeState(for: 12)),
        ]
    }
    
    
    
    func markChallengeAsCompleted(id: Int) {
        if let index = challenges.firstIndex(where: { $0.id == id }) {
            challenges[index].isAvailable = true
            
            ChallengePersistence.setChallengeState(for: id, isFinished: true)
            
            if index + 1 < challenges.count {
                challenges[index + 1].isAvailable = true
                ChallengePersistence.setChallengeState(for: challenges[index + 1].id, isFinished: true)
            }
        }
    }
}
