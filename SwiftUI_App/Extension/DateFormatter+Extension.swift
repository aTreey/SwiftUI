//
//  DateFormatter+Extension.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2022/8/19.
//  Copyright © 2022 于鸿鹏. All rights reserved.
//

import Foundation

extension String {
    static let cardDateString = "MMM dd yyyy"
    
    var iso8601: Date? {
        Formatter.iso8601.date(from: self)
    }
}

extension ISO8601DateFormatter {
  convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
    self.init()
    self.formatOptions = formatOptions
    self.timeZone = timeZone
  }
}

extension Formatter {
  static let iso8601 = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension DateFormatter {
    static var cardDateFormatter: DateFormatter {
        DateFormatter.formatter(for: .cardDateString)
    }
    
    static func formatter(for dateString: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateString
        return dateFormatter;
    }
}
