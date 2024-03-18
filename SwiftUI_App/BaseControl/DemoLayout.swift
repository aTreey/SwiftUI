//
//  DemoLayout.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/20.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct DemoLayout: View {
    @State private var width: CGFloat = 50
    
    var body: some View {
        VStack {
            SubView()
                .frame(width: self.width, height: 120)
                .border(Color.blue, width: 2)

            Text("Offered Width \(Int(width))")
            Slider(value: $width, in: 0...200, step: 1)
        }
    }
}

struct SubView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.yellow)
                .frame(width: max(proxy.size.width, 120), height: max(proxy.size.height, 120))
        }
    }
}

struct DemoLayout_Previews: PreviewProvider {
    static var previews: some View {
        DemoLayout()
    }
}
