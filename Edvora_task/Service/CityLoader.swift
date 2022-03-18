//
//  CityLoader.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import Foundation

final class CityLoader: ObservableObject {
    @Published var cities = [DropdownOption]()
    
    private let ridesLoader: RideLoader
    
    init(ridesLoader: RideLoader) {
        self.ridesLoader = ridesLoader
    }
    
    func updateCities(with state: String) {
        let allRides = Array(ridesLoader.allRides)
        var citiesInStates = [String: [DropdownOption]]()
        for ride in allRides {
            if citiesInStates[ride.state] == nil {
                citiesInStates[ride.state] = [DropdownOption(key: UUID().uuidString, value: ride.city)]
            } else {
                if(!citiesInStates[ride.state]!.contains { $0.value == ride.city }) {
                    citiesInStates[ride.state]!.append(DropdownOption(key: UUID().uuidString, value: ride.city))
                }
            }
        }
        cities = citiesInStates[state]!
    }
    
    
}
