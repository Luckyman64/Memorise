//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    
    static var emojis = ["🚓","🍔","🎮","🚚","🎺","😋","💩","🥷"]
    
    @Published var model = MemoryGame<String>(numberOfPairsOfCards: 5) {pairIndex in
        return emojis[pairIndex]
    }
    
}
