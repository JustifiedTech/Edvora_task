//
//  Date+Extension.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import Foundation

extension Date {
    static func > (lhs: Date, rhs: Date) -> Bool {
        return lhs.timeIntervalSinceReferenceDate > rhs.timeIntervalSinceReferenceDate
    }
}
