//
//  DropDownPicker.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import SwiftUI

struct DropDownPicker: View {
    @State private var shouldShowDropDown = false
    @State private var selectedOption: DropdownOption? = nil
    
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        VStack {
        Button(action: {
            self.shouldShowDropDown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray : Color.black)
                
                Spacer()
                
                Image(systemName: self.shouldShowDropDown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: 200, height: buttonHeight)
        .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
            
            
            VStack {
                if self.shouldShowDropDown {
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropDown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }
        }
    }
}

