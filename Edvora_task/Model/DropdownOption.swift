//
//  DropdownOption.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//


import Foundation

struct DropdownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}
