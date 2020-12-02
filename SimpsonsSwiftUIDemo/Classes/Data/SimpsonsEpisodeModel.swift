//
//  SimpsonsEpisodeModel.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct SimpsonsEpisodeModel: Identifiable, Codable, Hashable {
    private(set) var id: Int
    
    let imageUrlString: String
    let imdbRating: Double
    let imdbVotes: Int
    let numberInSeason: Int
    let numberInSeries: Int
    let originalAirDateString: String
    let originalAirYear: Int
    let productionCode: String
    let season: Int
    let title: String
    let usViewersInMillions: Double
    let videoUrl: String
    let views: Int

    var originalAirDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from:originalAirDateString)
    }

    var imageUrl: URL? {
        URL(string: imageUrlString)
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageUrlString = "image_url"
        case imdbRating = "imdb_rating"
        case imdbVotes = "imdb_votes"
        case numberInSeason = "number_in_season"
        case numberInSeries = "number_in_series"
        case originalAirDateString = "original_air_date"
        case originalAirYear = "original_air_year"
        case productionCode = "production_code"
        case season = "season"
        case title = "title"
        case usViewersInMillions = "us_viewers_in_millions"
        case videoUrl = "video_url"
        case views = "views"
    }
}

extension SimpsonsEpisodeModel {
    static let empty = SimpsonsEpisodeModel(id: 0,
        imageUrlString: "",
        imdbRating: 0,
        imdbVotes: 0,
        numberInSeason: 0,
        numberInSeries: 0,
        originalAirDateString: "",
        originalAirYear: 0,
        productionCode: "",
        season: 0,
        title: "",
        usViewersInMillions: 0,
        videoUrl: "",
        views: 0)
}
