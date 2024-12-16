struct GuardBotResponseConstant {
    
    static let allGreetings = [
        "hello", "hi", "hey", "whatsup", "hi there", "greetings", "yo", "howdy", "sup",
        "what's up", "hey there", "salutations", "hiya", "what's going on", "good day", "yo yo",
        "how's it going", "how's everything", "hey, how's it going", "hello there"
    ]
    
    
    static let greetingsResponse = [
        "Hello there!",
        "Hey! How can I assist you today?",
        "Hi there! How can I help?",
        "Hey! How's it going?",
        "Hello! What's up?",
        "Hi! What can I do for you?",
        "Greetings! How may I assist?",
        "Yo! How's it going?",
        "Howdy! How can I help?",
        "What's good? How can I help?",
        "Salutations! What brings you here?",
        "Hiya! How can I help today?",
        "Good day! What can I assist you with?",
        "What's going on? How can I help?",
        "Hey, how's everything going?",
        "Hello there, friend! How may I assist you?"
    ]
    
    
    static let allFarewells = [
        "goodbye", "bye", "see you", "take care", "later", "farewell", "catch you later",
        "peace", "see ya", "bye bye", "have a good day", "until next time", "take it easy",
        "goodnight", "see you soon", "take care of yourself", "see you later", "so long",
        "i'm out", "adieu", "catch you soon"
    ]
    
    static let farewellsResponse = [
        "Goodbye! Have a great day!",
        "Take care! See you next time!",
        "See you soon! Take care!",
        "Farewell! Have a wonderful time!",
        "Catch you later! Stay safe!",
        "Peace! Until next time!",
        "Goodbye! Don't be a stranger!",
        "See you later! Take it easy!",
        "Take care of yourself! See you soon!",
        "Bye bye! Stay awesome!",
        "Have a good day! Farewell!",
        "So long! Until we meet again!",
        "Goodnight! Take care!",
        "Until next time! Take care!",
        "Catch you soon! Stay safe!",
        "I'm out! Take care!"
    ]
    
    struct ClassifierLabels {
        static let NORMAL = "Normal"
        static let ANXIETY = "Anxiety"
        static let DEPRESSION = "Depression"
        static let SUICIDAL = "Suicidal"
        static let STRESS = "Stress"
        static let PERSONALITY_DISORDER = "Personality disorder"
        static let BIPOLAR = "Bipolar"
    }
    
    static let anxietyResponse = [
        "I'm really sorry you're feeling anxious right now. Take a deep breath and try to relax. Would you like me to guide you through some calming techniques?",
        "It's okay to feel anxious sometimes. I'm here for you. Let's try to take things one step at a time.",
        "I understand that you're feeling anxious. It might help to focus on your breathing or listen to some soothing music.",
        "Take a moment to center yourself. It's okay to take things slow. You're not alone.",
        "Anxiety can be tough, but you're doing great by reaching out. If you'd like, I can help you with breathing exercises."
    ]
    
    static let depressionResponse = [
        "I'm really sorry you're feeling down right now. Please remember you're not alone, and it's okay to seek help. Would you like some support?",
        "Depression can be really tough, but it's important to know that there are people who care about you. Don't hesitate to reach out to someone you trust.",
        "I'm here for you, and I know that you can get through this. Please talk to someone if you're feeling really low.",
        "It's okay to not feel okay sometimes. You're allowed to take your time and find support. Let's talk about how you're feeling.",
        "Remember, you don't have to face this alone. Consider speaking to a professional or a loved one for support."
    ]
    
    static let suicidalResponse = [
        "I'm really sorry you're feeling this way, but I can't provide the help you need. Please talk to a friend, family member, or a professional. You matter.",
        "You are so important, and your feelings are valid. Please reach out to a mental health professional or a trusted person who can help you through this.",
        "I'm really concerned for you. It's crucial to talk to someone who can help, whether it's a friend, family member, or a mental health professional.",
        "Please, reach out to someone who can provide you with the support you need right now. You don't have to go through this alone.",
        "I'm here for you, but it's really important that you talk to a professional who can help you better. You matter."
    ]
    
    static let stressResponse = [
        "I'm sorry you're feeling stressed. Let's work through it together. Take a few deep breaths and let me know how I can help.",
        "Stress is tough, but you're doing well by reaching out. Would you like some stress-relief exercises or some calming tips?",
        "It sounds like you're under a lot of stress right now. Let's take a break and talk about what's on your mind.",
        "It's okay to feel stressed. You're doing your best. Would you like some suggestions to help you feel a little better?",
        "Try to take things one step at a time. You're capable of managing your stress. I'm here to help if you want."
    ]
    
    static let personalityDisorderResponse = [
        "It sounds like you're feeling a bit overwhelmed, and that's completely okay. If you need to talk or find support, I'm here for you.",
        "Living with a personality disorder can be challenging. It's important to seek the support of a professional or loved ones.",
        "You're not alone in feeling this way. If you'd like, I can help you find resources or ways to manage difficult emotions.",
        "It's okay to take things one step at a time. You're doing the best you can. Would you like me to help you find coping techniques?",
        "Consider reaching out to a mental health professional who can support you on your journey. You deserve the help and support."
    ]
    
    static let bipolarResponse = [
        "Living with bipolar disorder can feel overwhelming at times, but you're not alone. Let's work together on how to manage things.",
        "I understand that you're going through a lot. It's okay to reach out for support from a mental health professional or someone close to you.",
        "Bipolar disorder can bring up many emotions. If you'd like, I can guide you through ways to stabilize your mood and feel more in control.",
        "It's okay to take a break and focus on managing your emotions. I’m here to help if you need support.",
        "If you're feeling overwhelmed, reaching out to a professional or trusted person can make all the difference. You're not alone in this."
    ]
    
    static let normalResponse = [
        "I'm Guard Bot, and I'm here to help you. Could you please clarify what you're trying to say?",
        "It seems like I didn’t quite catch that. Can you rephrase or provide more details?",
        "I didn’t quite understand that. Let’s try again! How can I assist you today?",
        "I’m not sure what you mean right now, but I’m here to assist! Please clarify.",
        "It looks like we’re having a little communication hiccup. Could you explain further?",
        "Hmm, I couldn’t get that. Can you try asking again, and I’ll do my best to assist?",
        "I’m Guard Bot, and I’m still learning. I didn’t quite understand, but feel free to ask anything!",
        "I’m here to help! However, I didn’t quite understand your message. Could you explain a bit more?",
        "I think I missed something there. Can you provide more information so I can assist you better?",
        "I’m ready to help, but I didn’t quite catch what you were saying. Can you clarify your question?"
    ]
    
}
