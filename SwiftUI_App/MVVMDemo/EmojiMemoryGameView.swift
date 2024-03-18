//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2022/8/23.
//  Copyright © 2022 480814177@qq.com. All rights reserved.
//

import SwiftUI

// 视图
// MVVM 首先处理的是视图； 再次是模型

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        Grid(items: viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
        }
        
        // 使用封装的 Grid
//        HStack {
//            ForEach(viewModel.cards) { card in
//                CardView(card: card).onTapGesture {
//                    viewModel.choose(card: card)
//                }
//            }
//        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidht)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                
                AsyncImage(url: URL(string: "https://images.ctfassets.net/ooa29xqb8tix/J6KiaOqQyBtSa84hx6fuI/2cd1d475743a2a42c8643b2a69e88547/Advanced_React_Hooks_800x600_cover.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                } placeholder: {
                    Color.purple
                }
            }
        }
    }
    
    let cornerRadius: CGFloat = 10
    let lineWidht: CGFloat = 3
}






struct ContentView_Provider: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
