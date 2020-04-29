//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2019/7/13.
//  Copyright © 2019 于鸿鹏. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            // 可以使用 frame(width:height:) 方法来设置 MapView 的大小。
            // 如果仅指定了 height 参数，view 会自动调整其内容的宽度。此节中， MapView 会展开并填充所有可用空间
            MapView()
                .frame(height: 300)
            
            // 图片
            CircleImage()
                .offset(y: -50)// 设置偏移
//                .padding(.bottom, -50)
            
            // 设置对齐方法
            VStack(alignment: .leading) {
                Text("Hellow swiftUI")
                    .font(.largeTitle)
                    .fontWeight(Font.Weight.ultraLight)
                    .foregroundColor(.yellow)
                
                Text("Test Text")
                    .font(.title)
                    .font(Font.system(size: 15))
                    .fontWeight(Font.Weight.regular)
                    .foregroundColor(.blue)

                

                HStack {
                    Text("Test text2")
                    .font(.headline)
                    
                    Text("Hello SwiftUI2")
                        .font(.headline)
                        .fontWeight(Font.Weight.medium)
                        .fontWeight(.light)
                        .foregroundColor(Color.orange)
                }
                    
                
                HStack(alignment: .bottom) {
                    Text("HStack")
                        .font(.footnote)
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(.black)
                        .font(Font.system(size: 16))
                    
                    // 添加分割
                    Spacer(minLength: 5)
                    Text("HStack - text")
                        .font(Font.system(size: 16))
                        .fontWeight(Font.Weight.semibold)
                }
            }
            .padding(15)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
