//
//  ButtonDemo2.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct ButtonDemo2: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Action!")
            }) {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }
        }
    }
}

struct ButtonDemo2_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo2()
    }
}
