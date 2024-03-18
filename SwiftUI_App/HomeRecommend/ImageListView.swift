//
//  ImageListView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/19.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct ImageListView: View {
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

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        let userData = PostUserData()
        return Group {
            ImageListView(images: Array(userData.recommendPostList.list[0].images[0...0]), width:kScreenWidth).environmentObject(userData)
                .previewLayout(.fixed(width: kScreenWidth, height: 300))
        }
    }
}
