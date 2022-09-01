//
//  EmojiMemoryGame.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2022/8/24.
//  Copyright © 2022 于鸿鹏. All rights reserved.
//

import Foundation

//由 createMemoryGame 代替
func createCardContent(pairIndex: Int) -> String {
    return "😀"
}



/// (ViewModel)视图模型
// 为什么使用 Class 而不是 Struct？

class EmojiMemoryGame: ObservableObject {

    // 保证数据安全，设置 model 外部为只读；只有内部可以修改
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // 创建卡片内容
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷️", "🐶"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { index in
            emojis[index]
        }
    }
    
    // 访问模型
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
