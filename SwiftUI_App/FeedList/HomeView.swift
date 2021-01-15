//
//  HomeView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/13.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

// 双列表实现
struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height)) {
                    HStack(spacing: 0) {
                        PostListView()
                        PostListView()
                    }
                }
            }
            
            
            // 使用ScrollView
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 0) {
//                    PostListView()
//                        .frame(width: kScreenWidth)
//                    PostListView()
//                        .frame(width: kScreenWidth)
//                }
//            }
            // 忽略底部安全区域
            .edgesIgnoringSafeArea(.bottom)
//            .navigationBarItems(leading: HomeNavgationBar(leftPercent: 1))
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
