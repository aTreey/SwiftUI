//
//  LandmarkList.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/4/30.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI


/// 地标列表
struct LandmarkList: View {
    var body: some View {
        // 静态cell
//        List{
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        
        
        // 动态cell
        /**
         list 使用 identifiable 的数据，我们可以使用以下两个方法之一来让数据变成 identifiable ：
         1. 使用 key path 属性来唯一标识每个元素
         2. 让数据类型遵循 Identifiable 协议
         */
        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
