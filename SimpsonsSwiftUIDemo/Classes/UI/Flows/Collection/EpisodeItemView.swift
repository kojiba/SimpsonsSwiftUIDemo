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
            VStack {
                HStack {
                    Spacer(minLength: .zero)
                    VStack {
                        Spacer(minLength: .zero)
                        AsyncImage(url: episodeModel.imageUrl)
                            .cornerRadius(.spacing)
                        
                        Spacer(minLength: .zero)
                    }
                    Spacer(minLength: .zero)
                }

                Text(episodeModel.title)
                    .multilineTextAlignment(.center)
                    .simpsonsFont()
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.label)
            }
                .padding(.all, .spacing * 2)
        }
            .background(
                RoundedRectangle(cornerRadius: .spacing * 2, style: .continuous)
                    .foregroundColor(.systemGray4)
                    .padding(.all, .spacing)
                    .defaultShadow()
            )
            .frame(height: 150)
    }
}

struct EpisodeItemView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeItemView(episodeModel: .sample)
    }
}
