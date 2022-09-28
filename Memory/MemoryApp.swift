//
//  MemoryApp.swift
//  Memory
//
//  Created by Clement Lantiat on 06/07/1401 AP.
//

import SwiftUI

@main
struct MemoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmojiMemoryGame())
        }
    }
}
