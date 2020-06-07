//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2019/7/13.
//  Copyright © 2019 于鸿鹏. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            // 可以使用 frame(width:height:) 方法来设置 MapView 的大小。
            // 如果仅指定了 height 参数，view 会自动调整其内容的宽度。此节中， MapView 会展开并填充所有可用空间
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            // 图片
            CircleImage(image: Image("turtlerock"))
                .offset(x: 0, y: -130)// 设置偏移
                .padding(.bottom, -130)
            
            // 设置对齐方法
            VStack(alignment: .leading, spacing: 10) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.state)
                    .font(.subheadline)
                    // 添加分割
                    Spacer(minLength: 5)
                    Text(landmark.park)
                        .font(.headline)
                        .fontWeight(Font.Weight.light)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                }
            }
            .padding(15)
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: NavigationBarItem.TitleDisplayMode.inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
#endif
