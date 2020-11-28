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
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        // 实际上是创建了TableView
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
