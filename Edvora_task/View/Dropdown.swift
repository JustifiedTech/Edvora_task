//
//  Dropdown.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import SwiftUI

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((DropdownOption) -> Void)?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(height: 500)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
    }
}
