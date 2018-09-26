//Model,totally UI independent
//provide the data to the UI
import Foundation
class Concentration
{
    var cards = [Card]()
    func chooseCard(at index:Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards:Int){
        for _ in 1..<numberOfPairsOfCards{  //_ because we do not care about this name
            let card = Card()
            cards += [card,card]  //why we add two card in it? they have the same value ,but not the same idendifier, right?
        }
    }
}
