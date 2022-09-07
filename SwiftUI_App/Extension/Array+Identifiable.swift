//
//  Array+Identifiable.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2022/9/7.
//  Copyright © 2022 于鸿鹏. All rights reserved.
//

import Foundation

// MARK: 数据增加扩展
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
