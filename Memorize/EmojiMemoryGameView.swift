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
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                               .aspectRatio(2/3, contentMode: .fit)
                               .onTapGesture {
                                   viewModel.choose(card)
                               }
            }
           
        })
        .foregroundColor(.red)
    }
    
    
}


struct CardView : View {
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else   if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
        
    }
    private func font(in size:CGSize) -> Font {
       Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.6
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
