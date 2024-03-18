//
//  HomeView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/13.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

// 双列表实现
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0, content: {
//                GeometryReader { geometry in
//                    HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height)) {
//                        HStack(spacing: 0) {
//                            PostListView()
//                            PostListView()
//                        }
//                    }
//                }
                
                SegmentView(titles: ["标题1", "标题2", "标题3", "标题3", "标题4",
                                     "标题5"])
                    .padding(.top, 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        PostListView()
                            .frame(width: kScreenWidth)
                        PostListView()
                            .frame(width: kScreenWidth)
                    }
                }
            })
            // 忽略底部安全区域
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


