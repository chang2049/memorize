//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chang Liu on 5/27/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
