//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/2/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State var emojiCount:Int = 20
    
    var body: some View {
        //        ScrollView {
        //            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
        //                ForEach(viewModel.cards) { card in
        //                    CardView(card: card)
        //                        .aspectRatio(2/3, contentMode: .fit)
        //                        .onTapGesture {
        //                            game.choose(card)
        //                        }
        //                }
        //            }
        //            .foregroundColor(.red)
        //        }
        //        .padding(.horizontal)
        AspectVGrid(items:viewModel.cards, aspectRatio:2/3, content: { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card)
                }
        })
    }
}


struct CardView : View {
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth:3)
                    Text(card.content).font(Font.system(size: min(geometry.size.width,geometry.size.height) * 0.9))
                } else   if card.isMatched{
                    shape.opacity(0 )
                } else {
                    shape.fill()
                }
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

//test
//test again
