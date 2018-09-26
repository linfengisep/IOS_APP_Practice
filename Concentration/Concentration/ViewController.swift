  //
//  ViewController.swift
//  Concentration
//
//  Created by linfeng wang on 23/09/2018.
//  Copyright © 2018 linfeng wang. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    lazy var game:Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flipCount = 0 {
        didSet {
            flipLabel.text = "Flips:\(flipCount)"
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
         flipCount = flipCount + 1;
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber){}
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            updateViewFromModel()
        }else{
            print("the chosen card was not in it")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)  :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    var emojiChoices = ["👻","😱","💀","🎃","🧜‍♀️","🐶","🦊","🦆","🐿","🇨🇳"]
    func emoji(for card:Card)->String{
        return "?"
    }
}

