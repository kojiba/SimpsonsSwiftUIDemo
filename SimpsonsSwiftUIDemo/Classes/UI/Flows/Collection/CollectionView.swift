//
//  CollectionView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    @State var data: SimpsonsEpisodesModel = .empty

    var body: some View {
        ScrollView {
            ForEach(self.data.episodes) { episode in
                CollectionItemView(episodeModel: episode)
            }
        }
            .onAppear(perform: loadData)
    }

    func loadData() {
        DispatchQueue.global().async {
            let manager = DataManager.shared

            guard let data = manager.loadJSONData() else {
                return
            }

            guard let episodes = manager.parseDataJSON(jsonData: data) else {
                return
            }

            print(episodes.episodes)
            
            DispatchQueue.main.async {
                self.data = episodes
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
