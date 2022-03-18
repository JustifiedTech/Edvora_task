//
//  ImageLoader.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import Foundation
import SwiftUI


final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var networkService: NetworkService
    var urlString: String
    
    init(urlString: String, networkService: NetworkService) {
        self.urlString = urlString
        self.networkService = networkService
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        networkService.loadImage(from: urlString, imageCompletion:  { data in
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self.image = image
            }
        })
    }
}
