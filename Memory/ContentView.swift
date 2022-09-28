//
//  ContentView.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            
            Text("Hello, world!")
        }
        .foregroundColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
