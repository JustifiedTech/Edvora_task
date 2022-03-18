//
//  DropdownRow.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import SwiftUI

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((DropdownOption) -> Void)?
    
    var body: some View {
        Button(action: {
            if let onOptionSelected = onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
