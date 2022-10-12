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
    }
    
    
    private var indexOfFirstCardUp: Int?{
        get {
            var faceUpIndices = [Int]()
            for index in cards.indices{
                if cards[index].isFaceUp{
                    faceUpIndices.append(index)
                }
            }
            if faceUpIndices.count==1{
                return faceUpIndices[0]
            }else{
                return nil
            }
        }
        set{
            for index in cards.indices{
                if index == newValue{
                    cards[index].isFaceUp = true
                }else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    mutating func choose(card: Card){
        
        if let chosenCardIndex = index(of: card),
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


