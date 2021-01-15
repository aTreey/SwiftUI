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
    var bindPost: Post {
        userData.post(forId: post.id)!
    }
    
    @EnvironmentObject var userData: PostUserData
    @State var presentComment: Bool = false
    
    var body: some View {
        var post = bindPost
        // 使用post局部变量
        return VStack(alignment: .leading, spacing: 10, content: {
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
                        // 更新关注数据
                        post.isFollowed = true
                        userData.update(post)
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
                    self.presentComment = true
                }
                .sheet(isPresented: $presentComment) {
                    CommentInput(post: post).environmentObject(self.userData)
                }
                Spacer()
                ActionButtonView(image:post.isLiked ? "heart.fill" : "heart",
                                 text: post.likeText,
                                 color: post.isLiked ? .blue : .black) {
                    print("点赞按钮")
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    } else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userData.update(post)
                }
                Spacer()
            })
            Rectangle()
                .padding(.horizontal, 0)
                .frame(height: 5)
                .foregroundColor(Color(UIColor.systemGray6))
                .padding(.horizontal, -15)
            
        })
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = PostUserData()
        return PostCell(post: userData.recommendPostList.list[0]).environmentObject(userData)
    }
}
