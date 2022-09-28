//
//  ContentView.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚓","🍔","🎮","🚚"]
    
    @State var emojiCount = 4
    var body: some View {
        VStack{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(5/3, contentMode: .fit)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
            
            Spacer()
            
            HStack{
                if(emojiCount > 0){
                    remove
                }
                
                Spacer()
            
                if(emojiCount < emojis.count){
                    add
                    .padding()
                }
            }
            .padding(.horizontal)
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
    var content: String
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
            }
            else{
                shape.foregroundColor(.gray)
            }
                
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
