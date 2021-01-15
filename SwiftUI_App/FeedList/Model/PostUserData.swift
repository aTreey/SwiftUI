//
//  UserData.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/14.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI
import Combine

class PostUserData: ObservableObject {
    @Published var recommendPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    
    private var recommendPostDict: [Int: Int] = [:]
    private var hotPostDict: [Int: Int] = [:]
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDict[post.id] = i
        }
        
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDict[post.id] = i
        }
    }
}

enum PostListCategory {
    case recommend
    case hot
}

extension PostUserData {
    
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend:
            return recommendPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDict[id] {
            return recommendPostList.list[index]
        }
        
        if let index = hotPostDict[id] {
            return hotPostList.list[index]
        }
        
        return nil
    }
    
    func update(_ post: Post) {
        if let index = recommendPostDict[post.id] {
            recommendPostList.list[index] = post
        }
        
        if let index = hotPostDict[post.id] {
            hotPostList.list[index] = post
        }
    }
}
