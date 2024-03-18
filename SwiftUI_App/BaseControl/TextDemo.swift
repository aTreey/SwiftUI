//
//  TextDemo.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/8/14.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct TextDemo: View {
    var body: some View {
        Text("SwiftUI Text")
        .foregroundColor(.orange)
        .bold()
        .font(.system(.largeTitle))
        .fontWeight(.medium)
        .italic() // 粗体/斜体的样式
        .shadow(color: .black, radius: 1, x: 0, y: 2)
    }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemo()
    }
}
