//
//  PostImageList.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/14.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

struct PostImageList: View {
    var images: [String]
    var width: CGFloat
    
    var body: some View {
        if images.count == 1 {
            loadImage(name: images[0])
                .resizable()
                .scaledToFill()
                .frame(width: self.width, height:self.width * 0.75)
                .clipped()
        } else if images.count == 2 {
            ImagesRow(images: images, width: self.width)
        } else if images.count == 3 {
            ImagesRow(images: images, width: self.width)
        } else if images.count == 4 {
            VStack(spacing: kImageSpace) {
                ImagesRow(images: Array(images[0...1]), width: self.width)
                ImagesRow(images: Array(images[2..<4]), width: self.width)
            }
            
        } else if images.count == 5 {
            VStack(spacing: kImageSpace) {
                ImagesRow(images: Array(images[0...2]), width: self.width)
                ImagesRow(images: Array(images[3...4]), width: self.width)
            }
        } else if images.count == 6 {
            VStack(spacing: kImageSpace) {
                ImagesRow(images: Array(images[0...2]), width: self.width)
                ImagesRow(images: Array(images[3...5]), width: self.width)
            }
        }
    }
}

struct ImagesRow: View {
    let images: [String]
    var width: CGFloat
    var body: some View {
        HStack(spacing: kImageSpace) {
            ForEach(images, id: \.self) { image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count), height: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped() // 超出裁剪
            }
        }
    }
}

struct PostImageList_Previews: PreviewProvider {
    static var previews: some View {
        let userData = PostUserData()
        return Group {
            PostImageList(images: Array(userData.recommendPostList.list[0].images[0...0]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 300))
            PostImageList(images:Array(userData.recommendPostList.list[0].images[0...1]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 200))
            PostImageList(images:Array(userData.recommendPostList.list[0].images[0...2]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 150))
            PostImageList(images:Array(userData.recommendPostList.list[0].images[0...3]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 400))
            PostImageList(images:Array(userData.recommendPostList.list[0].images[0...4]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 300))
            PostImageList(images:Array(userData.recommendPostList.list[0].images[0...5]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 300))
        }
//        .previewLayout(.fixed(width: kScreenWidth, height: 400)) // 设置预览宽度
    }
}
