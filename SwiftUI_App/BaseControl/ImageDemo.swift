
//
//  ImageDemo.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/9/14.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct ImageDemo: View {
    var body: some View {
        VStack {
            ForEach(1..<6, content: { (index) in
                Image("turtlerock")
                    .resizable()
                    .frame(width: CGFloat(30 * index), height: CGFloat(30 * index), alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            })
        }
    }
}

struct ImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemo()
    }
}
