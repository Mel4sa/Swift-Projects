import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer: Timer?
    var secondsRemaining = 0
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func press(_ sender: UIButton) {
        timer?.invalidate()
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness] ?? 0
        
     
        progressBar.progress = 0.0
        

        let totalTime = eggTimes[hardness] ?? 0
        progressBar.progress = 0.0 
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: ["totalTime": totalTime], repeats: true)
    }
    
    @objc func updateTimer(timer: Timer) {

        guard let userInfo = timer.userInfo as? [String: Int], let totalTime = userInfo["totalTime"] else {
            return
        }
        
        if secondsRemaining > 0 {
            let progress = Float(totalTime - secondsRemaining) / Float(totalTime)
            progressBar.progress = progress
            print("\(secondsRemaining) seconds remaining")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            print("Egg is ready!")
        
            playAlarmSound()
        }
    }
    
    func playAlarmSound() {
      
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
            if let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}
