//
//  MemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int) -> CardContent){
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: (pairIndex * 2), content: createCardContent(pairIndex)))
            cards.append(Card(id: (pairIndex * 2) + 1, content: createCardContent(pairIndex)))
        }
    }
    
    
    func choose(card: Card){
        print(card)
    }
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
}


