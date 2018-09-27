//Model,totally UI independent
//provide the data to the UI
import Foundation
class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceupCard :Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceupCard,matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier
                    {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceupCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceupCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards:Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
        var shuffled = [Card]()
        for _ in 0..<cards.count{
            let rand = Int(arc4random_uniform(UInt32(cards.count)))
            shuffled.append(cards[rand])
            cards.remove(at: rand)
        }
        cards = shuffled
    }
}
