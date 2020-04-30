//
//  CircleImage.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2019/7/15.
//  Copyright © 2019 于鸿鹏. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
            // 将图像剪成圆形
            .clipShape(Circle())
            // 创建边框
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4)
            )
            // 添加阴影
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
