//
//  ContentView.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚓","🍔","🍔","🚓","🎮","🎮"]
    var body: some View {
        HStack{
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
        .foregroundColor(.red)
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
