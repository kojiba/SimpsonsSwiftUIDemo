//
//  CollectionView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    @State var data: SimpsonsEpisodesModel?
    @State private var groups: [[SimpsonsEpisodeModel]]?

    @State private var isNavigatingDetails = false
    @State private var selectedEpisode: SimpsonsEpisodeModel = .empty

    var body: some View {
        VStack {
            stateView

            NavigationLink(destination: DetailView(episode: selectedEpisode), isActive: $isNavigatingDetails) {
                EmptyView()
            }
        }
            .onAppear(perform: load_data)
    }
    
    private var stateView: AnyView {
        if let episodesGroups = groups {
            return collection_view(groups: episodesGroups)
                .toAnyView()

        } else {
            return
                LoadingView()
                    .toAnyView()
        }
    }

    private func collection_view(groups: [[SimpsonsEpisodeModel]]) -> some View {
        ScrollView {
            VStack {
                ForEach(groups, id: \.self) { episodeGroup in
                    CollectionItemView(episodes: episodeGroup,
                        episodeViewClicked: self.episode_view_tapped)
                }
                Spacer(minLength: .zero)
            }
        }
    }
    
    private func episode_view_tapped(_ episode: SimpsonsEpisodeModel) {
        self.selectedEpisode = episode
        self.isNavigatingDetails = true
    }

    private func load_data() {
        DispatchQueue.global().async {
            let manager = DataManager.shared

            guard let data = manager.loadJSONData() else {
                return
            }

            guard let episodes = manager.parseDataJSON(jsonData: data) else {
                return
            }

//            print(episodes.episodes)
            
            let resultEpisodes = episodes.episodes.sorted {
                $0.imdbRating < $1.imdbRating
            }
            let result = SimpsonsEpisodesModel(episodes: Array(resultEpisodes))
            
            let groupsResult = self.group(data: result.episodes, countInGroup: 2)
            
            DispatchQueue.main.async {
                self.data = result
                self.groups = groupsResult
            }
        }
    }

    private func group(data: [SimpsonsEpisodeModel], countInGroup: Int) -> [[SimpsonsEpisodeModel]] {
        var groups = [[SimpsonsEpisodeModel]]()

        let fullGroupsCount = data.count / countInGroup
        let remaining = data.count % countInGroup

        for index in 0 ..< fullGroupsCount {
            var group = [SimpsonsEpisodeModel]()
            
            for groupIndex in 0 ..< countInGroup {
                let element = data[groupIndex + index * countInGroup]
                group.append(element)
            }
            
            groups.append(group)
        }

        var lastGroup = [SimpsonsEpisodeModel]()
        for index in data.count - remaining ..< data.count {
            lastGroup.append(data[index])
        }
        if lastGroup.count > 0 {
            groups.append(lastGroup)
        }

        return groups
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
