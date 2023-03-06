//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/3/1.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = [ "🐶", "🍕", "🚀", "🌈", "🎁", "🎵", "🌸", "💡", "🔥", "😊", "👑", "💰", "🍀", "⭐", "🏀", "💻", "🚗", "💖", "👍", "🐱", "☕", "🚲", "☂️", "🍰", "🔔", "😎", "👏", "💯" ]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
