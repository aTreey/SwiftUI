//
//  PostList.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/11/26.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .cyan
        UITableViewCell.appearance().selectionStyle = .none
        // 设置cell右边箭头不管用
        UITableViewCell.appearance().accessoryView = nil
    }
    
    var body: some View {
        // 实际上是创建了TableView
        List {
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(
                        destination: PostDetaiView(post: post),
                        label: { })
                        .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
            NavigationView {
                PostListView()
                    .navigationBarTitle("首页", displayMode: .inline)
                    .navigationBarHidden(false)
            }
    }
}
