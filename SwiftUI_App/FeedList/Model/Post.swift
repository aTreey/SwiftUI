//
//  Post.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/10/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostList: Codable {
    var data: [Post]
}


// MARK: - Result

/// 遵守Codable协议，可编码/解码，可以 json <-> struct 互转
/// struct 缺少json中属性可解析成功，多余出来的不解析成功，类型与json 不匹配也解析不成功
struct Post: Codable {
    let videoURLSource: String
    let latitude: String
    let auditCode, id, questionProductID: Int
    let isEditorial: Bool
    let topic: Topic
    let browseSum, favourSum: Int
    let isCollect: Bool
    let wgs84Longitude: String
    let quizzer: Comment
    let descriptionHandled, title, videoID: String
    let commentLimit: Bool
    let longitude: String
    let status: Int
    let surfacePlot: String
    let avatar: String
    let resultDescription: String
    let type: Int
    let address: String
    let location: String
    let videoURLSuper, miniPath, auditDescription: String
    let operationStyleType: Int
    let videoURLStandard, videoURL: String
    let iwomVo, comment: Comment
    let isAttention: Bool
    let playTime: String
    let commentSum: Int
    let videoPixel: String
    let collectSum: Int
    let pixel: String
    let isFavour: Bool
    let content: String
    let level: Int
    let wgs84Latitude, guide: String
    let accountID: String
    let nickname, urlRule: String
    let releaseTime: Int
    let poiID, videoURLHigh: String
    let shareSum, answerSum: Int
    let isShowOperationTitle: Bool
    let group: Comment
    let userIdentities: [Int]

}

let postList = loadPostListData("postListData_recommend.json")


// 解析json数据
func loadPostListData(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("不能找到\(fileName) 文件")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("加载\(fileName)文件出错")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("解析list json 数据错误")
    }
    return list
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



