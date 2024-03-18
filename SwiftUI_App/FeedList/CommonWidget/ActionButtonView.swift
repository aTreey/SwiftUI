//
//  ActionView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/11/26.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct ActionButtonView: View {
    let image: String
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 5, content: {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            })
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(image: "heart", text: "点赞", color: .red, action: {
            print("点击了动作按钮")
        })
    }
}
