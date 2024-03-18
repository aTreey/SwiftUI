//
//  TopicTagView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/19.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct TopicTagView: View {
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        if #available(iOS 14.0, *) {
            LazyVGrid(columns: columns) {
                ForEach((0...10), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                }
            }.font(.largeTitle)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct TopicTagView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            TopicTagView()
        } else {
            // Fallback on earlier versions
        }
    }
}
