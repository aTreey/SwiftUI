//
//  PostList.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/11/26.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    // 使用环境对象，可以从环境对象中获取
    @EnvironmentObject var userData: PostUserData
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .cyan
        UITableViewCell.appearance().selectionStyle = .none
        UITableViewCell.appearance().accessoryView = nil
    }
    
    var body: some View {
        // 实际上是创建了TableView
        List {
            ForEach(userData.postList(for: .recommend).list) { post in
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
                PostListView().environmentObject(PostUserData())
                    .navigationBarTitle("首页", displayMode: .inline)
                    .navigationBarHidden(false)
            }
    }
}
