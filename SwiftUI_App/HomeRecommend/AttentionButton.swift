//
//  AttentionButton.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/18.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct AttentionButton: View {
    var isLiked: Bool = false
    var body: some View {
        Button(action: {
            print("点击关注按钮")
        }) {
            Text("关注")
                .foregroundColor(.blue)
                .font(.system(size: 14))
                .frame(width: 60, height: 26)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct AttentionButton_Previews: PreviewProvider {
    static var previews: some View {
        AttentionButton()
    }
}
