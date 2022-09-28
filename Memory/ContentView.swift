//
//  ContentView.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    @State var emojiCount = 4
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(viewModel.model.cards) { card in
                    CardView(card: card)
                        .aspectRatio(5/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.model.choose(card: card)
                        }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            
            Spacer()
            
//            HStack{
//                if(emojiCount > 0){
//                    remove
//                }
//
//                Spacer()
//
//                if(emojiCount < emojis.count){
//                    add
//                    .padding()
//                }
//            }
//            .padding(.horizontal)
        }
    }
    var add: some View{
        Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle").font(.largeTitle)
        }
    }
    var remove: some View{
        Button {
            emojiCount -= 1
        } label: {
            Image(systemName: "minus.circle").font(.largeTitle)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text(card.content)
                    .font(.largeTitle)
            }
            else{
                shape.foregroundColor(.gray)
            }
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.light)
    }
}
