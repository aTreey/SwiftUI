//
//  LandmarkList.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/4/30.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI


/// 地标列表
struct LandmarkList: View {
    
    // state 是一个值或一组值，它可以随时间变化，并且会影响视图的行为、内容或布局
//    @State var showFavoritesOnly = false
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        // 1. 静态cell
        // List{
        //    LandmarkRow(landmark: landmarkData[0])
        //    LandmarkRow(landmark: landmarkData[1])
        // }
        
        
        /**
         一、设置导航
         */
        // 给 list 嵌入到一个NavgationView 中
        NavigationView {
            // 动态cell
            /**
             list 使用 identifiable 的数据，我们可以使用以下两个方法之一来让数据变成 identifiable ：
             1. 使用 key path 属性来唯一标识每个元素
             2. 让数据类型遵循 Identifiable 协议
             */
//            List(landmarkData) { landmark in
//                // 包装在NavigationButton中，实现导航跳转
//
//                if !self.showFavoritesOnly || landmark.isFavorite {
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
            
                
            // 列表中组合静态和动态视图，或者将两个或多个不同的动态视图组合在一起，要使用 ForEach 类型，而不是将数据集合传递给 List
            List {
                // 开关视图
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(landmarkData) { (landmark) in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle(Text("导航栏 Landmarks"))
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // 添加预览设备
//        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                // 展示设备名称
//            .previewDisplayName(deviceName)
//        }
//        // 一旦将 environmentObject(_:) 修饰符应用于父级， userData 属性就会自动获取它的值
//        .environmentObject(UserData())
        
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
