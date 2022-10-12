//
//  EmojiMemoryGameView.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    @State var emojiCount = 4
    var body: some View {
        VStack{
            text
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(5/8, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            
            Spacer()
            
            HStack(spacing:50){
                ForEach(Theme.allCases, id:\.self){theme in
                    Button(
                        action: {
                        game.theme = theme
                    },
                        label: {
                            VStack{
                                Image(systemName: theme.imageName)
                                    .font(.title)
                                Text(theme.imageSubTitle)
                            }
                    }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
    var text: some View{
        Text("Memorize!")
            .font(.title)
    }
}

struct CardView: View {
    var card: EmojiMemoryGame.Card
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text(card.content)
                    .font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.foregroundColor(.gray)
            }
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .preferredColorScheme(.light)
    }
}
