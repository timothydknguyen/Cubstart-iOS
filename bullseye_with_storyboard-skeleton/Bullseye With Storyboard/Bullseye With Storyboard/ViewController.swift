//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    var randomNumber = 0
    var range = 100
    var level = 1
    var best = 0
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value) &&
                randomNumber + 3 >= Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
                
                // increasing difficulty
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                
                // updating level
                level += 1
                currentLevel.text = String(level)
                
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        } else {
            if Int(numSlider.value) == randomNumber {
                resultLabel.text = "You were right on point! Bullseye!"
                
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        }
        
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        // updating high score
        if level > best && level != 1 {
            best = level
            highScore.text = String(best)
        }
        
        // resetting slider, numLabel
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        // hiding resultLabel, playAgainButton
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        // resetting range & slider
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
        
        // resetting level
        level = 1
        currentLevel.text = String(level)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        // numLabel.text = "\(Int(numSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(best)
    }

}

