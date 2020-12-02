//
//  CollectionItemView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct CollectionItemView: View {
    @State var episodes: [SimpsonsEpisodeModel]
    var episodeViewClicked: (_: SimpsonsEpisodeModel) -> Void = { episode in }

    var body: some View {
        HStack {
            ForEach(self.episodes) { episode in
                Button(action: { self.episodeViewClicked(episode) }) {
                    EpisodeItemView(episodeModel: episode)
                }
            }
        }
    }
}

struct CollectionItemView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionItemView(episodes: [.empty, .empty])
    }
}
