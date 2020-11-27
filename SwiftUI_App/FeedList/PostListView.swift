//
//  PostList.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/11/26.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    var body: some View {
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
