//
//  ViewController.swift
//  Concentration
//
//  Created by linfeng wang on 23/09/2018.
//  Copyright © 2018 linfeng wang. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips:\(flipCount)"
        }
    }
    var emojiChoices = ["👻","🎃","👻","🎃"]
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
         flipCount = flipCount + 1;
        if let cardNumber = cardButtons.index(of: sender){
           flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("card number:\(cardNumber)")
        }else{
            print("the chosen card was not in it")
        }
    }
    func flipCard(withEmoji emoji:String,on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

