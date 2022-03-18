//
//  ImageView.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//
import SwiftUI

struct NetworkImageView: View {
    @ObservedObject var imageToLoad: ImageLoader
    
    init(imageUrl: String, networkService: NetworkService) {
        imageToLoad = ImageLoader(urlString: imageUrl, networkService: networkService)
    }
    var body: some View {
        Image(uiImage: imageToLoad.image ?? UIImage())
            .resizable()
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView(imageUrl: "https://picsum.photos/200", networkService: NetworkService())
    }
}
