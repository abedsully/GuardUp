import AVFoundation

class MediaPlayer {
    static let shared = MediaPlayer()
    var player: AVAudioPlayer?
    var player2: AVAudioPlayer?
    
    func playMusic(forFileName filename: String, forFormatIn format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: format) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = vol
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopOngoingMusic() {
        guard let bgmPlayer = player else { return }
        bgmPlayer.stop()
    }
    
    func playSoundEffect(forFileName soundEffectFileName: String, forFormatIn format: String, vol: Float) {
        guard let url = Bundle.main.url(forResource: soundEffectFileName, withExtension: format) else { return }
        do {
            player2 = try AVAudioPlayer(contentsOf: url)
            player2?.volume = vol
            player2?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
