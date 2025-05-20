

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageview1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
  
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let diceArray = [
            UIImage(named: "DiceOne"),
             UIImage(named: "DiceTwo"),
             UIImage(named: "DiceThree"),
             UIImage(named: "DiceFour"),
             UIImage(named: "DiceFive"),
            UIImage(named: "DiceSix")]
        
        diceImageview1.image =
            diceArray [ Int.random(in: 0...5)  ]
        
  
        
        diceImageView2.image = diceArray[ Int.random(in: 0...5) ]
      
        
 
    }
}
