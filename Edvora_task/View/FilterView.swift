//
//  FilterView.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject private var citiesLoader: CityLoader
    
    var ridesLoader: RideLoader
    
    init(ridesLoader: RideLoader) {
        self.ridesLoader = ridesLoader
        citiesLoader = CityLoader(ridesLoader: ridesLoader)
    }
    
    var body: some View {
        VStack {
            Text("Filters")
            
            DropDownPicker(placeholder: "State", options: ridesLoader.stateDropDownOptions ?? []) { option in
                ridesLoader.sortRidesBy(state: option.value, citiesLoader: citiesLoader)
            }
            
            DropDownPicker(placeholder: "City", options: citiesLoader.cities) { option in
                ridesLoader.sortRidesBy(city: option.value)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(ridesLoader: RideLoader(networkService: NetworkService(), ref: 0))
    }
}

