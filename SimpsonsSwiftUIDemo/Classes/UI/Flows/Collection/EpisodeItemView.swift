//
//  EpisodeItemView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct EpisodeItemView: View {
    var episodeModel: SimpsonsEpisodeModel

    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: .zero)
                VStack {
                    Spacer(minLength: .zero)
                    AsyncImage(url: episodeModel.imageUrl)
                    Spacer(minLength: .zero)
                }
                Spacer(minLength: .zero)
            }
            Text(episodeModel.title)
                .multilineTextAlignment(.center)
                .simpsonsFont()
        }
    }
}

struct EpisodeItemView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeItemView(episodeModel: .empty)
    }
}