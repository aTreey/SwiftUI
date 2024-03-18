//
//  HomeCustomNavBar.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/20.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct HomeCustomNavBar: View {
    var titles: [String] = ["标题1", "标题2", "标题3", "标题3", "标题4",
                           "标题5"]
    var body: some View {
        SegmentView(titles: titles)
    }
}

struct HomeCustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeCustomNavBar()
    }
}


