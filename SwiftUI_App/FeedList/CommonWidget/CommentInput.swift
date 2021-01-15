//
//  CommentInput.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/14.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

private let tips = "评论不能为空"

struct CommentInput: View {
    let post: Post
    
    @State var text: String = ""
    @State var showTips: Bool = false
    
    // 获取存储在环境的值
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: PostUserData
    
    @ObservedObject private var keyboardResponder = KeyboradResponder()
    
    var body: some View {
        VStack {
            CommentTextView(text: $text, beginEditingOnAppear: true)
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("取消").padding()
                }
                Spacer()
                Button(action: {
                    if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        withAnimation {
                            showTips = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                showTips = false
                            }
                        }
                        return
                    }
                    
                    var post = self.post
                    post.commentCount += 1
                    self.userData.update(post)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("发送").padding()
                }
            }
            .font(.system(size: 18))
            .foregroundColor(.black)
        }
        
        .padding(.bottom, keyboardResponder.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardResponder.showKeyboard ? .bottom : [])
        .overlay(
            Text(tips)
                .scaleEffect(showTips ? 1 : 0.5) // 设置缩放
                .animation(.spring(dampingFraction: 0.3))
                .opacity(showTips ? 1 : 0)
                .animation(.easeInOut)
        )
    }
}

struct CommentInput_Previews: PreviewProvider {
    static var previews: some View {
        CommentInput(post: PostUserData().recommendPostList.list[0])
    }
}
