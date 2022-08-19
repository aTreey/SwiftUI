//
//  Date+Extension.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2022/8/19.
//  Copyright © 2022 于鸿鹏. All rights reserved.
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
