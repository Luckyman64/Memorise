//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    private static var emojis = ["🚓","🍔","🎮","🚚","🎺","😋","💩","🥷"]
    
    @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 5) {pairIndex in
        return emojis[pairIndex]
    }
    
    var cards: [Card]{
        return model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card: card)
    }
}
