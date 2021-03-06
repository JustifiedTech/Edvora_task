//
//  UserLoader.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import Foundation

final class UserLoader: ObservableObject {
    @Published var user: User?
    private let userUrl = "https://assessment.api.vweb.app/user"
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        loadUser()
    }
    
    func loadUser() {
        networkService.loadData(from: userUrl) { [weak self] user in
            self?.user = user
        }
    }
}
