//
//  CollectionView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct Pair<Type> {
    var left: Type
    var right: Type?
}

struct CollectionView: View {
    @State var data: SimpsonsEpisodesModel?

    var body: some View {
        VStack {
            stateView
        }
            .onAppear(perform: loadData)
    }
    
    private var stateView: AnyView {
        if let episodes = data {
            return collectionView(episodes: episodes).toAnyView()
        } else {
            return
                LoadingView().toAnyView()
        }
    }

    private func collectionView(episodes: SimpsonsEpisodesModel) -> some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(episodes.episodes) { episode in
                        HStack {
                            CollectionItemView(episodeModel: episode)
                            CollectionItemView(episodeModel: episode)
                        }
                    }
                }
            }
            Spacer()
        }
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
//                let resultEpisodes = episodes.episodes.prefix(20)
//                let result = SimpsonsEpisodesModel(episodes: Array(resultEpisodes))

                let result = episodes

                self.data = result
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
