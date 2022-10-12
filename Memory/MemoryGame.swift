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
    
    
    mutating func choose(card: Card){
        
        let chosenCardIndex = index(of: card)
        cards[chosenCardIndex].isFaceUp.toggle()
        print(cards)
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
}


