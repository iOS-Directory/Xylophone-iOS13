import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        sender.alpha = 0.5
        //Get the current key being pressed
        let keyPressed = (sender.currentTitle!)
      
        //Invoke the Func and pass the current key as agument
        playSound(soundName: keyPressed)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = 1
        })
        
        
    }
    
    //Function to play sound
    func playSound(soundName: String) {
        
        //get the sound as a variable and the current key being pressed
        //will act as the corresponding name of the sound
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //
        player = try! AVAudioPlayer(contentsOf: url!)
        
        //finally play the sound
        player.play()
    }
}
