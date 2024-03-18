//
//  MemoryGame.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2022/8/23.
//  Copyright © 2022 480814177@qq.com. All rights reserved.
//

import Foundation

/// 整体记忆游戏的 主要数据结构

// 创建数据模型时使用go-to数据结构：1. 考虑模型时做什么？； 2. 数据结构中有那么变量和 函数

// (Model)
struct MemoryGame<CardContent> {
    // 因为是卡片匹配记忆游戏，所以应该有cards
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card choose: \(card)")
        
//        card.isFaceUp = !card.isFaceUp
        
        if let chooseIndex = cards.firstIndex(matching: card) {
            // 修改的是cards 数组中的值
            cards[chooseIndex].isFaceUp = !cards[chooseIndex].isFaceUp
        }
        
        // 修改的是 chooseCard 的值，因为结构体是值类型的，会复制一个值
//        var chooseCard = cards[chooseIndex]
//        chooseCard.isFaceUp = !chooseCard.isFaceUp
    }
    
    // 提供初始化方法
    init(numberOfPairsOfCards: Int, cardContentFactory:(Int) -> CardContent) {
        cards = Array<Card>()
        for idx in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(idx)
            cards.append(Card(content: content, id: idx * 2))
            cards.append(Card(content: content, id: idx * 2 + 1))
        }
    }
    
    // 嵌套是为了标识是此命名空间下的，（结构体Card是MemoryGame 中的card）
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        // content 类型可能是Int，String，Image，也可能是任何东西，并不需要我们关心，所以使用泛型表示
        var content: CardContent
        var id: Int
        
    }
}

