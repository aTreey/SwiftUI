//
//  TextDemo.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/9/14.
//  Copyright © 2020 于鸿鹏. All rights reserved.
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
