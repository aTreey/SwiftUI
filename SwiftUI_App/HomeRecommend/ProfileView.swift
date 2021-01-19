//
//  ProfileView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/18.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("turtlerock")
                .resizable()
                .frame(width: 40,
                       height: 40,
                       alignment: .center)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    LevelBadge()
                        .offset(x: 15.0, y: 15.0)
                )
                .onTapGesture {
                    print("点击头像")
            }
            VStack(alignment: .leading, spacing: 5, content: {
                HStack(spacing: 4) {
                    Text("我是谁")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Identity()
                }
                Text("2020年01月15")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            })
            .padding(0)
            
            Spacer()
            AttentionButton()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
