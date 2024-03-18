//
//  Date+Extension.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2022/8/19.
//  Copyright © 2022 480814177@qq.com. All rights reserved.
//

import Foundation

extension Date {
    static var topOfTheHour: Date {
        let cmps = Calendar.current.dateComponents([.year, .month, .day, .hour], from: .now)
        return Calendar.current.date(from: cmps)!
    }
    
    var cardString: String {
        let formatter = DateFormatter.cardDateFormatter
        return formatter.string(from: self)
    }
}
