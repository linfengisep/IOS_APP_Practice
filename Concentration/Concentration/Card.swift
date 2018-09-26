//
// Card.swift
//  Concentration
/*
 how card behave here, not the content, Card is UI independent
 self.idendifier = my idendifier
*/

import Foundation
struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier :Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() ->Int{
        Card.identifierFactory += 1
        return identifierFactory
    }
    
     init(){
       self.identifier = Card.getUniqueIdentifier()
    }
}
