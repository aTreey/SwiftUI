//
//  LevelBadge.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/10/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI


/// 用户等级组件
struct LevelBadge: View {
    let level = 0;
    var body: some View {
        Group {
            if level == 0 {
                Text("V")
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white)
                    )
            }
        }
    }
}

struct LevelBadge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LevelBadge()
        }
    }
}
