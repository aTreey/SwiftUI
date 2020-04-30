//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2019/7/13.
//  Copyright © 2019 于鸿鹏. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    var body: some View {
        VStack {
            // 可以使用 frame(width:height:) 方法来设置 MapView 的大小。
            // 如果仅指定了 height 参数，view 会自动调整其内容的宽度。此节中， MapView 会展开并填充所有可用空间
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            // 图片
            CircleImage()
                .offset(x: 0, y: -130)// 设置偏移
                .padding(.bottom, -130)
            
            // 设置对齐方法
            VStack(alignment: .leading, spacing: 10) {
                Text("标题")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("子标题")
                    .font(.subheadline)
                    // 添加分割
                    Spacer(minLength: 5)
                    Text("详细描述")
                        .font(.headline)
                        .fontWeight(Font.Weight.light)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                }
            }
            .padding(15)
            
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
#endif
