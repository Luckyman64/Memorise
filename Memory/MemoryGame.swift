//
//  MemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards:Int, createCardContent:(Int) -> CardContent){
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: (pairIndex * 2), content: createCardContent(pairIndex)))
            cards.append(Card(id: (pairIndex * 2) + 1, content: createCardContent(pairIndex)))
        }
        cards = cards.shuffled()
    }
    
    
    private var indexOfFirstCardUp: Int?{
        get {
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly()
        }
        set{
            cards.indices.forEach({cards[$0].isFaceUp = ($0 == newValue)})
        }
    }
    
    mutating func choose(card: Card){
        
        if let chosenCardIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenCardIndex].isFaceUp,
            !cards[chosenCardIndex].isMatched{
            if let indexOfFirstCardUp = indexOfFirstCardUp {
                if cards[chosenCardIndex].content == cards[indexOfFirstCardUp].content{
                    cards[chosenCardIndex].isMatched = true
                    cards[indexOfFirstCardUp].isMatched = true
                }
                
                cards[chosenCardIndex].isFaceUp.toggle()
            }else{
                
                indexOfFirstCardUp = chosenCardIndex
            }
        }
    }
    
    private func index(of card: Card) -> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
    
}

extension Array{
    func oneAndOnly() -> Element? {
        if self.count == 1{
            return first
        }else{
            return nil
        }
    }
}
