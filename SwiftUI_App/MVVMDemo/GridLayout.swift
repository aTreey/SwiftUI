//
//  GridLayout.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2022/9/7.
//  Copyright © 2022 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct GridLayout {
    private(set) var size: CGSize
    private(set) var rowCount: Int = 0
    private(set) var columnCount: Int = 0
    
    init(itemCount: Int, nearAspectRatio desiredAspectRatio: Double = 1, in size: CGSize) {
        self.size = size
        guard size.width != 0, size.height != 0, itemCount > 0 else {
            return
        }
        
        var bestLayout: (rowCount: Int, columnCount: Int) = (1, itemCount)
        // 最小方差
        var smallestVariance: Double?
        // 容器宽高比
        let sizeAspectRatio = abs(Double(size.width / size.height))
        for rows in 1...itemCount {
            // itemCount: 1     1/1 = 1 +   1%1 = 0     1
            // itemCOunt: 2     2/1 = 2 +   2%1 = 0     2
            //                  2/2 = 1 +   2%2 = 0     1
            let columns = (itemCount / rows) + (itemCount % rows > 0 ? 1 : 0)
            if (rows - 1) * columns < itemCount {
                // item宽高比
                let itemAspectRatio = sizeAspectRatio * (Double(rows) / Double(columns))
                let diff = abs(itemAspectRatio - desiredAspectRatio)
                if smallestVariance == nil || diff < smallestVariance! {
                    smallestVariance = diff
                    bestLayout = (rowCount: rows, columnCount: columns)
                }
            }
        }
        rowCount = bestLayout.rowCount
        columnCount = bestLayout.columnCount
    }
    
    var itemSize: CGSize {
        if rowCount == 0 || columnCount == 0 {
            return .zero
        }
        return CGSize(width: size.width / CGFloat(columnCount), height: size.height / CGFloat(rowCount))
    }
    
    func location(ofItemAt index: Int) -> CGPoint {
        if rowCount == 0 || columnCount == 0 {
            return .zero
        }
        return CGPoint(x: (CGFloat(index % columnCount) + 0.5) * itemSize.width, y: (CGFloat(index / columnCount) + 0.5) * itemSize.height)
    }
}
