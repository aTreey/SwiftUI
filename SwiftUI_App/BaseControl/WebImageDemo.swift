//
//  WebImageDemo.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/8/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct WebImageDemo: View {
    
    @State private var uiImage: UIImage?
    
    let placeholderImage = UIImage(named:"turtlerock")!
    
    var body: some View {
        Image(uiImage: self.uiImage ?? placeholderImage)
            .resizable()
            .onAppear(perform: downloadWebImage)
            .frame(width: 80,
                   height: 80,
                   alignment: .center)
            .onTapGesture {
                print("Tap ")
        }
    }
    
    func downloadWebImage() {
        guard let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600314682613&di=5c55c0ebe9fb26312de6a5ad20fe5962&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201105%2F17%2F113554rnu40q7nbgnn3lgq.jpg") else {
            print("无效的图片链接")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            } else {
                print("error: \(String(describing: error))")
            }
        }
    }
}

struct WebImageDemo_Previews: PreviewProvider {
    static var previews: some View {
        WebImageDemo()
    }
}
