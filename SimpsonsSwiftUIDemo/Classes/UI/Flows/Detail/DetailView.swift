//
//  DetailView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct DetailItemViewModel: Identifiable {
    var title: String
    var value: String

    var id: String {
        title
    }
}

struct DetailView: View {
    @State var episode: SimpsonsEpisodeModel
    @State private var items: [DetailItemViewModel] = []
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(self.items) { item in
                        DetailItemView(item: item)
                    }
                }
            }
            Spacer()
        }
            .onAppear(perform: onAppear)
    }

    private func onAppear() {
        self.items = [
            DetailItemViewModel(title: "Identifier", value: "\(episode.id)"),
            DetailItemViewModel(title: "IMDB Rating", value: "\(episode.imdbRating)"),
            DetailItemViewModel(title: "IMDB Votes Count", value: "\(episode.imdbVotes)"),
            DetailItemViewModel(title: "Number In Season", value: "\(episode.numberInSeason)"),
            DetailItemViewModel(title: "Number In Series", value: "\(episode.numberInSeries)"),
            DetailItemViewModel(title: "Original Air Date", value: "\(episode.originalAirDateString)"),
            DetailItemViewModel(title: "Original Air Year", value: "\(episode.originalAirYear)"),
            DetailItemViewModel(title: "ProductionCode", value: "\(episode.productionCode)"),
            DetailItemViewModel(title: "Season", value: "\(episode.season)"),
            DetailItemViewModel(title: "Title", value: "\(episode.title)"),
            DetailItemViewModel(title: "Us Viewers (In Millions)", value: "\(episode.usViewersInMillions)"),
            DetailItemViewModel(title: "Video URL", value: episode.videoUrl),
            DetailItemViewModel(title: "Views count", value: "\(episode.views)")
        ]
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(episode: .empty)
    }
}
