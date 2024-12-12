import Foundation

class ChallengePersistence {
    static let userDefaults = UserDefaults.standard
    static let challengeKeyPrefix = "challenge_"

    static func getChallengeState(for id: Int) -> Bool {
        if id == 1 {
            return true
        }
        return userDefaults.bool(forKey: "\(challengeKeyPrefix)\(id)")
    }

    static func setChallengeState(for id: Int, isFinished: Bool) {
        userDefaults.set(isFinished, forKey: "\(challengeKeyPrefix)\(id)")
    }
}
