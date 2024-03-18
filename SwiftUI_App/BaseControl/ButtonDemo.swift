//
//  ButtonDemo.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/8/20.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        VStack {
//            Spacer()
            EditButton().padding(20)
            Button(action: {self.action()}) {
                Text("SwiftUI Button")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 2)
                )
            }
            .padding(20)

            Button(action: {self.action()}) {
                HStack {
                    Text("立即开通")
                        .fontWeight(.semibold)
                        .font(.headline)
                }
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }.padding(20)

            Button(action: {self.action()}) {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(5)
            }.padding(20)
            
            Button(action: {
                self.action()
            }) {
                HStack {
                    Text("立即开通")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                // 按钮的弹性宽度，我们设定  maxWidth 参数为  .infinity。示按钮会填满容器视图(container view) 的宽度
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }.padding(20)
            
            // 对于按钮样式提取封装后的写法
            Button(action: {self.action()}) {
               HStack {
                   Text("按钮样式封装")
                       .fontWeight(.semibold)
                       .font(.title)
               }
           }
            .buttonStyle(GradientBackgroundStyle())
            .padding(20)

        }
        .background(
            Image("turtlerock")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all))
    }
    
    func action() {
        print("button 点击事件")
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40) // 此处注意跟padding的调用顺序
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}
