//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    
    private static var emojis = ["🚓","🍔","🎮","🚚","🎺","😋","💩","🥷"]
    
    @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 5) {pairIndex in
        return emojis[pairIndex]
    }
    
    var cards: [MemoryGame<String>.Card]{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
