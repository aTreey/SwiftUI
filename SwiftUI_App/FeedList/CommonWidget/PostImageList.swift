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
        HStack(spacing: 5) {
            ForEach(images, id: \.self) { image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count - 1), height: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
}

struct PostImageList_Previews: PreviewProvider {
    static var previews: some View {
        let userData = PostUserData()
        return PostImageList(images: userData.recommendPostList.list[0].images, width:kScreenWidth).environmentObject(userData)
    }
}
