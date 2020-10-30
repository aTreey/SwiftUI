 //
//  PostCell.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/28.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostCell: View {
//    let post: Post
    var body: some View {
        HStack(alignment: .center, spacing: 2, content: {
            Image(uiImage: UIImage(named: "turtlerock")!)
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    LevelBadge()
                        .offset(x: 18.0, y: 18.0)
                )
                .padding(5)
            VStack(alignment: .leading, spacing: 5, content: {
                Text("post.nickname")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(String("post.releaseTime"))
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            })
            
//            if !post.isAttention {
                Spacer()
                Button(action: {
                    print("点击关注按钮")
                }) {
                    Text("关注")
                        .foregroundColor(.blue)
                        .font(.system(size: 14))
                        .frame(width: 60, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.blue, lineWidth: 1)
                    )
                }
                .padding(10)
//            }
        })
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
