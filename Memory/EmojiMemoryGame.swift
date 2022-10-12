//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import Foundation
enum Theme: CaseIterable{
    case vehicule
    case animal
    case food
    
    var emojis: [String]{
        switch self {
        case .vehicule:
            return ["🚓","🚌","🏎","🚚","🚜","🚒","🚛","🚙"]
        case .animal:
            return ["🐶","🐭","🐱","🦁","🐷","🐻","🐸","🐰"]
        case .food:
            return ["🍕","🍔","🌮","🍟","🌭","🍜","🥐","🍙"]
        }
    }
    
    var imageName: String{
        switch self {
        case .vehicule:
            return "car"
        case .animal:
            return "tortoise"
        case .food:
            return "mouth"
        }
    }
    
    var imageSubTitle: String{
        switch self {
        case .vehicule:
            return "Vehicules"
        case .animal:
            return "Animaux"
        case .food:
            return "nouritures"
        }
    }
    func model()-> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            self.emojis[pairIndex]
        }
    }
}
class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
    
    @Published private var model = Theme.animal.model()
    
    var theme:Theme = .animal{
        didSet{
            model = theme.model()
        }
    }
        
    
    
    var cards: [Card]{
        return model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card: card)
    }
    func changeTheme(_ theme: Theme){
        model = theme.model()
        
    }
    
}
