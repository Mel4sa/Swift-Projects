import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAudioSession()
    }
    
    func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session yapılandırılamadı: \(error.localizedDescription)")
        }
    }

    @IBAction func keyPressed(_ sender: UIButton) {


        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
   
            
    
            sender.alpha = 1.0
        }
        
        playSound(soundName: sender.currentTitle!)
    }
    
    func playSound(soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Ses dosyası çalınırken hata oluştu: \(error.localizedDescription)")
            }
        }
    }
}
