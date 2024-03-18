//
//  DemoAlignment.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/20.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct DemoAlignment: View {
    var width: CGFloat
    var tiles: [String]
    var body: some View {
        VStack {
            a_Demo1()
            Spacer()
            a_Demo2()
        }
//        alignment(in: width)
    }
    
    private func a_Demo1() -> some View {
        ZStack(alignment: .topLeading) {
            Text("Hello")
                .alignmentGuide(.leading, computeValue: { d in return 0 })
                .alignmentGuide(.top, computeValue: { d in return 0 })
                .background(Color.green)
            
            Text("World")
                .alignmentGuide(.top, computeValue: { d in return 100 })
                .alignmentGuide(.leading, computeValue: { d in return d[.top] })
                .background(Color.purple)
            
        }
        .background(Color.orange)
    }
    
    private func a_Demo2() -> some View {
        // firstTextBaseline表示所有text的以各自最上边的那一行的base line对齐,
        HStack(alignment: .lastTextBaseline) {
            Text("测试Alignment属性")
                .font(.caption)
                .frame(width: 50)
                .background(Color.orange)

            Text("测试Alignment属性")
                .font(.body)
                .frame(width: 50)
                .background(Color.green)

            Text("测试Alignment属性")
                .font(.largeTitle)
                // 使用显式对齐方式, 跟它的父类容器的HStack对齐参数有关，
//                .alignmentGuide(.lastTextBaseline, computeValue: { (d) -> CGFloat in
////                    return 100
//                    d[.firstTextBaseline]
//                })
                .frame(width: 50)
                .background(Color.blue)

        }
        .background(Color.gray)
    }
        
    private func alignment(in w: CGFloat) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading, content: {
            ForEach(self.tiles, id: \.self) { title in
                self.item(for: title)
                    .padding([.trailing, .bottom], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > w)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if title == self.tiles.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
            }
        })
    }
    
    private func item(for text: String) -> some View {
        Text(text)
            .padding([.leading, .trailing], 8)
            .frame(height: 30)
            .font(.subheadline)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .onTapGesture {
                print("tap Gesture")
            }
    }
}

struct DemoAlignment_Previews: PreviewProvider {
    static var previews: some View {
        DemoAlignment(width: kScreenWidth * 0.5, tiles: Array(arrayLiteral: "1", "2", "3", "4"))
    }
}
