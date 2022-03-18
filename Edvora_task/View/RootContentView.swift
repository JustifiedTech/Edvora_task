//
//  RootContentView.swift
//  Edvora_task
//
//  Created by JustifiedTech on 3/18/22.
//

import SwiftUI

struct RootContentView: View {
    @ObservedObject var userLoader: UserLoader
    var networkService = NetworkService()
    
    init() {
        userLoader = UserLoader(networkService: networkService)
    }
    var body: some View {
        VStack {
            HStack {
                Text("Edvora")
                    .font(.largeTitle)
                    .padding()
                Spacer()
                NetworkImageView(imageUrl: userLoader.user?.url ?? "", networkService: networkService)
                    .frame(width: 42, height: 42)
                    .cornerRadius(21)
                    .padding()
            }
            ListView(networkService: networkService, ref: userLoader.user?.station_code ?? 0)
        }
    }
}

struct RootContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}

