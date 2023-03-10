//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ๆฝ้นค็พค on 2023/3/1.
//

import SwiftUI

class EmojiMemoryGame:ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = [ "๐ถ", "๐", "๐", "๐", "๐", "๐ต", "๐ธ", "๐ก", "๐ฅ", "๐", "๐", "๐ฐ", "๐", "โญ", "๐", "๐ป", "๐", "๐", "๐", "๐ฑ", "โ", "๐ฒ", "โ๏ธ", "๐ฐ", "๐", "๐", "๐", "๐ฏ" ]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
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
