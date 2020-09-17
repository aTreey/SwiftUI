//
//  TestStack.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/9/16.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct TestStack: View {
    var title: String
    var subTitle: String
    var spacing: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            Text(title).font(.title)
            Text(subTitle).font(.subheadline)
        }
    }
}

struct TestStack_Previews: PreviewProvider {
    static var previews: some View {
        TestStack(title:"预览", subTitle:"预览副标题", spacing: 15)
    }
}
