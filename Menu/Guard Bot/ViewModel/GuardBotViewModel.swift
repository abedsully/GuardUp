import SwiftUI
import CoreML

@MainActor
class GuardBotViewModel: ObservableObject {
    @Published var chatMessages: [Message] = []
    @Published var mediaPlayer = MediaPlayer()
    
    
    func preprocessText(text: String) -> String {
        return text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

    func getBotResponse(message: String) -> String {
        let preprocessedMessage = preprocessText(text: message)
        let analyzedEmotion = analyzeSentiment(message: preprocessedMessage)

        if GuardBotResponseConstant.allGreetings.contains(preprocessedMessage) {
            if let randomResponse = GuardBotResponseConstant.greetingsResponse.randomElement() {
                return randomResponse
            }
        } else if GuardBotResponseConstant.allFarewells.contains(preprocessedMessage) {
            if let randomResponse = GuardBotResponseConstant.farewellsResponse.randomElement() {
                return randomResponse
            }
        }
        
        switch analyzedEmotion {
        case GuardBotResponseConstant.ClassifierLabels.ANXIETY:
            return GuardBotResponseConstant.anxietyResponse.randomElement() ?? "It seems like you're feeling anxious. How can I help?"
        case GuardBotResponseConstant.ClassifierLabels.DEPRESSION:
            return GuardBotResponseConstant.depressionResponse.randomElement() ?? "I’m sorry you’re feeling down. Let me know how I can assist."
        case GuardBotResponseConstant.ClassifierLabels.STRESS:
            return GuardBotResponseConstant.stressResponse.randomElement() ?? "It looks like you're stressed. How can I support you?"
        case GuardBotResponseConstant.ClassifierLabels.SUICIDAL:
            return GuardBotResponseConstant.suicidalResponse.randomElement() ?? "I'm really sorry you're feeling like this. It's important to talk to someone."
        case GuardBotResponseConstant.ClassifierLabels.BIPOLAR:
            return GuardBotResponseConstant.bipolarResponse.randomElement() ?? "It seems like you're feeling overwhelmed. Let me know how I can help."
        case GuardBotResponseConstant.ClassifierLabels.PERSONALITY_DISORDER:
            return GuardBotResponseConstant.personalityDisorderResponse.randomElement() ?? "I understand that things might be challenging. I'm here to help."
        default:
            return GuardBotResponseConstant.normalResponse.randomElement() ?? "I'm Guard Bot. How can I assist you today?"
        }
    }
    
    func sendMessage(_ message: String) {
        
        let userMessage = Message(text: message, isFromUser: true)
        chatMessages.append(userMessage)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let botResponseText = self.getBotResponse(message: message)
            let botMessage = Message(text: botResponseText, isFromUser: false)
            self.chatMessages.append(botMessage)
            self.mediaPlayer.speak(sound: botResponseText)
        }
    }
    
    func analyzeSentiment(message: String) -> String {
        do {

            let model = try GuardBotClassifier(configuration: MLModelConfiguration())
            

            let input = GuardBotClassifierInput(text: message)
            

            let options = MLPredictionOptions()
            let output = try model.prediction(input: input, options: options)

            let result = output.label

            return result

        } catch {
            return ""
        }
    }
}
