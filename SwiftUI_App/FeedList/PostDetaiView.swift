//
//  PostDetaiView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/11.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct PostDetaiView: View {
    var post: Post
    var body: some View {
        List {
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetaiView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = PostUserData()
        return PostDetaiView(post: userData.recommendPostList.list[0]).environmentObject(userData)
    }
}
