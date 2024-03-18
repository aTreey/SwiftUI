//
//  Identity.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/18.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct Identity: View {
    var isOne: Bool = true
    var isRealOne: Bool = true
    var body: some View {
        Group {
            HStack(spacing: 0) {
                if isOne {
                    Text("ONE")
                        .font(.system(size: 8))
                        .frame(width: 28, height: 12)
                        .foregroundColor(Color.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                if isRealOne {
                    Text("Ui")
                        .italic()
                        .fontWeight(.bold)
                        .frame(width: 28, height: 12)
                        .font(.system(size: 8))
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                    )
                        .padding(.leading, 4)
                }
            }
        }
    }
}

struct Identity_Previews: PreviewProvider {
    static var previews: some View {
        Identity()
    }
}
