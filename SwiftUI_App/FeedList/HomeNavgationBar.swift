//
//  HomeNavgationBar.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/11.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

private let kTextWidth: CGFloat = 60.0
private let kButtonHeight: CGFloat = 24.0

struct HomeNavgationBar: View {
    @State var leftPercent: CGFloat // 0 left, 1 right
    var body: some View {
        HStack {
            Button(action: {
                print("点击按钮")
            }, label: {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 0)
                    .foregroundColor(.black)
            })
            Spacer()
            VStack(spacing: 3) {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
                    Text("推荐")
                        .bold()
                        .frame(width: kTextWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                        }
                    Spacer()
                    Text("热门")
                        .bold()
                        .frame(width: kTextWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                        }
                })
                .font(.system(size: 20))

                // 获取整个父容器的宽度
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.blue)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kTextWidth)
                }
                .frame(height: 6)
            }
            .frame(width: kScreenWidth * 0.5)
            Spacer()
            Button(action: {
                print("点击按钮")
            }, label: {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(10)
                    .foregroundColor(.black)
            })
        }
    }
}

struct HomeNavgationBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeNavgationBar(leftPercent: 0)
        }
    }
}
 
 
