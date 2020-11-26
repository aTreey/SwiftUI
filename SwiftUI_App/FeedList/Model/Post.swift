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

struct Post: Codable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
//    var commentCount: Int
//    var likeCount: Int
    var isLiked: Bool 
}

// 全局变量
let postList = loadPostListData("PostListData_recommend_1.json")


// 解析json数据
func loadPostListData(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("不能找到\(fileName) 文件")
    }
    
    let data: Data
    let str: String
    do {
        data = try Data(contentsOf: url)
    } catch let error {
        print("错误信息：\(error)")
        fatalError("加载\(fileName)文件出错")
    }

    str = String(data: data, encoding: .utf8) ?? "字符串"
    let dataStr = str;
    print(dataStr)
    do {
        return try JSONDecoder().decode(PostList.self, from: data)
    } catch let er {
        print("错误信息：\(er)")
        fatalError("解析 \(fileName) json 数据到\(PostList.self)错误")
    }
}

// MARK: - Comment
struct Comment: Codable {
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

// MARK: - Topic
struct Topic: Codable {
    let contentNum, productID, browseNum, topicMark: Int?
    let type: Int?
    let name: String?
    let participantsNum: Int?
}



