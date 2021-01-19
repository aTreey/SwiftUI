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
    let level = 0
    var icon: String {
        switch level {
        case 1:
            return "b"
        case 2:
            return "c"
        case 3:
            return "d"
        default:
            return "icon_silver"
        }
    }
    var body: some View {
        Group {
            if level == 0 {
                Image(icon)
                    .resizable()
                    .frame(width: 15,
                           height: 15)
                    .scaledToFill()
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
