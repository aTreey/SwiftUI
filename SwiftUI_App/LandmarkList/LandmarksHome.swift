//
//  LandmarksHome.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2022/8/18.
//  Copyright © 2022 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    // Dictionary 结构的初始化方法 init(grouping:by:) 把地标组合到分类中，输入地标的 category 属性。
    var categories: [String:[Landmark]] {
        Dictionary(grouping: landmarkData, by: {$0.category.rawValue})
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
