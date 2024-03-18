//
//  DemoGeometryReader.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/20.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

/// GeometryReader: 能够获取到父view建议的尺寸。
struct DemoGeometryReader: View {
    var body: some View {
        VStack {
            demo()
            gr_demo()
        }
    }
    
    // 获取父view建议尺寸
    private func gr_demo() -> some View {
        return GeometryReader(content: { geometry in
            HStack(spacing: 0) {
                Text("来个例子🌰吧，\(geometry.size.width)")
                    .foregroundColor(.blue)
                    .layoutPriority(1) // 设置优先级让换行
                MyRectangle()
            }
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .border(Color.green, width: 1)
        })
    }
    
    private func demo() -> some View {
        return HStack(spacing: 0) {
            Text("来个例子🌰吧")
                .foregroundColor(.blue)
            MyRectangle()
        }
        .frame(width: 200, height: 100, alignment: .center)
        .border(Color.green, width: 1)
    }

    struct MyRectangle: View {
        var body: some View {
            Rectangle().fill(Color.green)
        }
    }
}

struct DemoGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        DemoGeometryReader()
    }
}
