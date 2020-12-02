//
//  CollectionItemView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct CollectionItemView: View {
    var episodeModel: SimpsonsEpisodeModel

    var body: some View {
        VStack {
            AsyncImage(url: episodeModel.imageUrl)
            Text(episodeModel.title)
                .simpsonsFont()
        }
    }
}

struct CollectionItemView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionItemView(episodeModel: .empty)
    }
}
