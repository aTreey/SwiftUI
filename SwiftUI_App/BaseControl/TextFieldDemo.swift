//
//  TextFieldDemo.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/14.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct TextFieldDemo: View {
    @State private var name = ""
    @State private var password = ""
    
    let nameText = Text("昵称: ").font(.system(size:16))
    let pwdText = Text("密码: ").font(.system(size:16))
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 15) {
            HStack {
                nameText
                TextField("请输入用户名", text: $name, onEditingChanged: { (changed) in
                    print("onEditingChanged: \(changed)")
                }) {
                    print("userName: \(self.name)")
                }
                .padding(10)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            HStack {
                pwdText
                SecureField("请输入密码", text: $password) {
                    print("password: \(self.password)")
                }
                .padding(10)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

struct TextFieldDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo()
    }
}
