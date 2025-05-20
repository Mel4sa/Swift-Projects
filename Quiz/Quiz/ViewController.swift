

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionIndex = 0
    let quiz = [
        ("Swift is a programming language.", true),
        ("The Sun sets in the east.", false),
        ("2 + 2 equals 4.", true),
        ("The Earth is flat.", false),
        ("Water boils at 90°C.", false),
        ("A year has 365 days.", true),
        ("The capital of France is Berlin.", false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
  
    @IBAction func pressButton(_ sender: UIButton) {
        let userAnswer = sender == trueButton
        let correctAnswer = quiz[questionIndex].1

        if userAnswer == correctAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
  
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            sender.backgroundColor = UIColor.systemBlue
            self.nextQuestion()
        }
    }
    
    func nextQuestion() {
        if questionIndex < quiz.count - 1 {
            questionIndex += 1
            updateUI()
        } else {
         
            questionLabel.text = "Quiz finished! 🎉"
            trueButton.isEnabled = false
            falseButton.isEnabled = false
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionIndex].0
        progressBar.progress = Float(questionIndex + 1) / Float(quiz.count)  
    }
}
