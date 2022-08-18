//
//  Landmark.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/4/29.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI
import CoreLocation


/// Landmark 结构体，用来存储 app 需要显示的所有地标数据，并从 landmarkData.json 导入一组地标数据。
struct Landmark: Hashable, Codable, Identifiable {
    // 遵循 Identifiable 协议需要声明一个唯一标示
    var id: Int
    var name: String
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    
//    var description: String //

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // 字符串类型枚举，
    
    /**
     * CaseInterable 协议，枚举类型实现这个协议后，能自动生成一个包含所有 case 项的数组
     * Codable 协议， 类似NSCoding协议，它对结构体，枚举和类都支持，能够把JSON这种弱类型数据转换成代码中使用的强类型数据，同时由于编译器的帮助，可以使开发者少写很多重复代码。
     * Hashable 协议，遵守了Equatable，可判断对象是否相同
     */
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
