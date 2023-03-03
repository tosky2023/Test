//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/2/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel:EmojiMemoryGame  
    
    @State var emojiCount:Int = 20
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
    
    
    struct CardView : View {
        
        let card:MemoryGame<String>.Card
        
        var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth:3)
                    Text(card.content).font(.largeTitle)
                } else   if card.isMatched{
                    shape.opacity(0 )
                } else {
                    shape.fill()
                }
            }
        }
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel:game)
        }
    }
    
}


//test
