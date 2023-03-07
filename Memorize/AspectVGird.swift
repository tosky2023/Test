//
//  AspectVGird.swift
//  Memorize
//
//  Created by 潘鹤群 on 2023/3/7.
//

import SwiftUI

struct AspectVGrid<Item,ItemView>: View where ItemView:View, Item:Identifiable {
    var items:[Item]
    var aspectRatio:CGFloat
    var content:(Item) -> ItemView
    
    
    
    var body: some View {
        let width : CGFloat = 100
        LazyVGrid(columns:[adaptiveGridItem(width: width)],spacing: 0) {
            ForEach(items) { item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
    }
    
    private func adaptiveGridItem(width:CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    
    
    private func widthThatfits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat (columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
            return floor(size.width / CGFloat (columnCount))
        }
        return floor(size.width / CGFloat (columnCount))
    }
}
