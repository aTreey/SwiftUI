 //
//  PostCell.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/28.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack(spacing: 5, content: {
                post.avatarImage
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        LevelBadge()
                            .offset(x: 18.0, y: 18.0)
                    )
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(post.name)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Text(String(post.date))
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                })
                .padding(.leading, 10)
                
                if post.isLiked {
                    Spacer()
                    Button(action: {
                        print("点击关注按钮")
                        let list = postList.list
                        let data = list[0]
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
                    .buttonStyle(BorderlessButtonStyle())
                }
            })
            // 文字描述
            Text(post.text)
                .font(.system(size: 17))
            
            // 添加图片
            if !post.images.isEmpty {
                loadImage(name: post.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: kScreenWidth - 30, height: (kScreenWidth - 30) * 0.75)
                    .clipped()
            }
            Divider()
            
            HStack(spacing: 0, content: {
                Spacer()
                ActionButtonView(image: "message", text:post.commentText, color: .black) {
                    print("评论按钮")
                }
                Spacer()
                ActionButtonView(image: "heart", text: post.likeText, color: .black) {
                    print("点赞按钮")
                }
                Spacer()
            })
            Rectangle()
                .padding(.horizontal, 0)
                .frame(height: 5)
                .foregroundColor(Color.secondary)
                .padding(.horizontal, -15)
            
        })
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
