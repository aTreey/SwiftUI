//
//  Post.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/10/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

// MARK: - PostList

/// 遵守Codable协议，可编码/解码，可以 json <-> struct 互转
/// struct 缺少json中属性可解析成功，多余出来的不解析成功，类型与json 不匹配也解析不成功

struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
        
    var commentText: String {
        if commentCount <= 0 {
            return "评论"
        }

        if commentCount < 1000 {
            return "\(commentCount)"
        }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeText: String {
        if likeCount <= 0 {
            return "点赞"
        }
        
        if likeCount < 1000 {
            return "\(likeCount)"
        }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}

// MARK: - Operation
struct Operation: Codable {
    let productID, operationContentID, browseNum: Int
    let subTitle: String
    let imageRes: String
    let participantsNum, type: Int
    let image: String
    let operationID: Int
    let website: String
    let contentNum: Int
    let name: String
}

// 全局变量
//let postList: Post = loadJSONData("PostListData_recommend_1.json")
