//
//  LandmarkRow.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/4/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    // 添加 landmark 属性时，存储数据
    var landmark: Landmark
    
    var body: some View {
        // 默认使用中间对齐
        HStack {
            landmark.image
                // 将图片缩放到指定的尺寸
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(landmark.name).padding(0)
            // 设置各个边距
//            Text(landmark.name).padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 20))
//            Text(landmark.name).padding(.leading, 10)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
//        .padding(15)
    }
}


/// 此处的代码只会影响画布中的视图
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // 我们可以在 preview provider 中使用 Group 来返回多个预览
        Group{
            LandmarkRow(landmark: landmarkData[0])
                // 用 previewLayout(_:) 修饰符设置行视图在列表中的预览大小
//                .previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarkData[1])
                // 用 previewLayout(_:) 修饰符设置行视图在列表中的预览大小
                
        }
        // 把 previewLayout(_:) 的调用移到 group 声明的外面来精简代码
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
