//
//  DemoList.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/8/25.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct DemoList: View {
    
    var demos: [Demo] = [Demo(name: "LandMark"), Demo(name: "Drawing Paths and Shapes")]
    
    var isShow: Bool = false
    @State private var name = "姓名"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                TestStack(title:"封装标题", subTitle:"封装副标题", spacing: 15)
                Text("测试")
                    .font(.title)
                    .foregroundColor(Color.red)
                Text("测试122232")
                    .font(.subheadline)
                
                if !isShow {
                    Text("逻辑判断")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                
//                  let 语句无法通过 function builder 创建合适的输出
//                let show = self.isShow
//                if show {
//                    Text("逻辑判断")
//                        .font(.subheadline)
//                        .foregroundColor(.blue)
//                }
                
                Image("turtlerock")
                    .clipShape(Circle())
                .shadow(radius: 10)
                }
            .navigationBarHidden(false)
            .navigationBarTitle(Text("Swift UI Demo"))
        }
    }
}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}

struct Demo: Identifiable {
    var id: UUID = UUID()
    var name: String
}

