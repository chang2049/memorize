//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chang Liu on 5/27/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ index in travelAndPlaces[index]}
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards:Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //MARK: Intents
    
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
}
