//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/2/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: EmojiMemoryGame())
        }
    }
}
