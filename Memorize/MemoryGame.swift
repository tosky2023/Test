//
//  MemoryGame.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/3/1.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private(set) var cards:Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUp: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp})
            
 //上面一行代替下面的   var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
                if faceUpCardIndices.count == 1 {
                    return faceUpCardIndices.first
                } else {
                    return nil
                }
            }
            set {
            for index in cards.indices {
                if index != newValue {
                    
                    cards[index].isFaceUp = false
                } else {
                    cards[index].isFaceUp = true
                }
               
            }
        }
    }
    
     
    mutating func choose(_ card:Card) {
        if let chosenIndex = cards .firstIndex(where: {$0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
             if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                 cards[chosenIndex].isFaceUp  = true
             } else {
                
                 indexOfTheOneAndOnlyFaceUp = chosenIndex
             }
        }
    }
    

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let  content = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content,id: pairIndex*2+1))
        }
        
        
    }

    
    
    
    struct Card:Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content:CardContent
        var id: Int
    }
}
