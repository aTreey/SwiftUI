//
//  Data.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/4/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

//import UIKit
import SwiftUI
import CoreLocation


let landmarkData: [Landmark] = load("landmarkData.json")


/// 解析json数据
/// - Parameter filename: json数据文件名
/// - Returns: 模型
func load<T: Codable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("在main bundle 中找不到文件")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("不能解析\(filename) as \(T.self): \n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    private var images: _ImageDictionary = [:]
    private static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = guaranteeImage(name: name)
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    
    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("从bundle中加载图片失败")
        }
        return image
    }
    
    private func guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) {
            return index
        }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
