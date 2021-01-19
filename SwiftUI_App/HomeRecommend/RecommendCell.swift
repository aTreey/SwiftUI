//
//  RecommendCell.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/18.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

struct RecommendCell: View {
    var title: String = "文章标题"
    var desc: String = "在政治无线局域网手机无线局域网的时候我发现自己已经没有什么问题可以理解为别人考虑了一下什么🤔？我们在我想,在政治无线局域网手机无线局域网的时候我发现自己已经没有什么问题可以理解为别人考虑了一下什么🤔？我们在我想"
    var images: [String] {
        return Array(PostUserData().recommendPostList.list[0].images)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProfileView()
                .padding(.vertical, 12)
            Text(title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 18))
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            Text(desc)
                .font(.system(size: 14))
                .lineLimit(2)
                .padding(.vertical, 5)
            PostImageList(images: images, width: kScreenWidth - 24)
                .padding(.vertical, 5)
        }
        .padding(.horizontal, 12)
    }
}

struct RecommendCell_Previews: PreviewProvider {
   static var previews: some View {
       return RecommendCell()
   }
}

