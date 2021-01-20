//
//  DemoSegment.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/20.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import SwiftUI

struct DemoSegment: View {
    var titles = ["推荐", "最新", "视频", "精华", "口碑",
                  "问答"]
    var body: some View {
        SegmentView(titles: titles)
    }
}

struct SegmentView: View {
    
    @State var titles: [String]
    @State var selectedIndex: Int = 0
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<titles.count) { index in
                SegementItem(title: titles[index],
                             index: index,
                             selectedIndex: selectedIndex)
                    .onTapGesture {
                        withAnimation {
                            self.selectedIndex = index
                        }
                    }
            }
        }
        .backgroundPreferenceValue(SegementPreferenceKey.self) { preferences in
            GeometryReader { proxy in
                self.bottomLine(proxy, preferences: preferences)
            }
        }
        .padding(.bottom, 20)
//        .background(Color.gray)
    }
    
    struct SegementItem: View {
        let title: String
        let index: Int
        let selectedIndex: Int
        
        var body: some View {
            Text(title)
                .scaleEffect(index == self.selectedIndex ? 1.0 : 1.0)
                .foregroundColor(index == self.selectedIndex ? .primary : .secondary)
                .padding(.all, 5)
                .anchorPreference(key: SegementPreferenceKey.self, value: .bounds, transform: {
                    [SegementPreferenceData(viewIdx: index, bounds: $0)]
                })
                .transformAnchorPreference(key: SegementPreferenceKey.self, value: .topLeading, transform: { (value: inout [SegementPreferenceData], anchor: Anchor<CGPoint>) in
                    value[0].topLeading = anchor
                })
        }
    }
    
    func bottomLine(_ proxy: GeometryProxy, preferences: [SegementPreferenceData]) -> some View {
            let p = preferences.first(where: { $0.viewIdx == self.selectedIndex })
            let bounds = proxy[p!.bounds]
        
            return RoundedRectangle(cornerRadius: 2)
                .foregroundColor(.blue)
                .frame(width: bounds.width - 24, height: 4)
                .offset(x: bounds.minX + 12, y: bounds.height - 5)
                .animation(.easeInOut)
                .padding(.top, 5)
                .padding(.bottom, 20)
        }
}

/// 定义子view传给父view的数据
struct SegementPreferenceData {
    let viewIdx: Int
    let bounds: Anchor<CGRect>
    var topLeading: Anchor<CGPoint>? = nil
}


/// 遵守PreferenceKey协议
struct SegementPreferenceKey: PreferenceKey {
    typealias Value = [SegementPreferenceData]
    static var defaultValue: Value = []
    /// key 只会有一个值，所以要按一定逻辑进行收敛。我们这里就简单将所有字典进行 merge，将它们变成一个字典给到父视图
    static func reduce(value: inout [SegementPreferenceData], nextValue: () -> [SegementPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct DemoSegment_Previews: PreviewProvider {
    static var previews: some View {
        DemoSegment()
    }
}
