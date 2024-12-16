import AVFoundation
import SwiftUI

class MediaPlayer: ObservableObject {
    static let shared = MediaPlayer()
    var musicPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    @State private var speechSynthesizer: AVSpeechSynthesizer?
    private var synthesizer = AVSpeechSynthesizer()
    
    func playMusic(forFileName filename: String, forFormatIn format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: format) else { return }
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.numberOfLoops = -1
            musicPlayer?.volume = vol
            musicPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopOngoingMusic() {
        guard let bgmPlayer = musicPlayer else { return }
        bgmPlayer.stop()
    }
    
    func playSoundEffect(forFileName soundEffectFileName: String, forFormatIn format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: soundEffectFileName, withExtension: format) else { return }
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            soundEffectPlayer?.volume = vol
            soundEffectPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func speak(sound: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: sound)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-UK")
        
        synthesizer.speak(utterance)
    }
    
    func stopSpeaking() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }
}
