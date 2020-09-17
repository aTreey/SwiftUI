//
//  Badge.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/25.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct Badge: View {
    var body: some View {
//        Text("Badge")
        Path { path in
            let width: CGFloat = 100.0
            let height = width
            path.move(to: CGPoint(x: width * 0.95, y: height * 0.20))
            HexagonParameters.points.forEach {
                path.addLine(
                    to: .init(
                        x: width * $0.useWidth.0 * $0.xFactors.0,
                        y: height * $0.useHeight.0 * $0.yFactors.0
                    )
                )
            }
        }
        .fill(Color.black)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
