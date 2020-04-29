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
//        Text("Hello SwiftUI Image!")
        Image("gugong")
            .aspectRatio(CGSize(width: 300, height: 300), contentMode: .fill)
            // 将图像剪成圆形
            .clipShape(Circle())
            // 创建边框
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4)
            )
            // 添加阴影
            .shadow(radius: 10)
            .imageScale(Image.Scale.small)
            .frame(width: 100, height: 100, alignment: .center)
    }
}

//#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
//#endif
