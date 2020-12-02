//
// Created by kojiba on 02.12.2020.
// Copyright (c) 2020 kojiba. All rights reserved.
//

import Foundation

struct SimpsonsEpisodesModel: Codable {
    let episodes: [SimpsonsEpisodeModel]
}

extension SimpsonsEpisodesModel {
    static let empty = SimpsonsEpisodesModel(episodes: [])
}

class DataManager {

    static let shared = DataManager()

    func loadJSONData() -> Data? {
        guard let docURL = Bundle.main.url(forResource: "simpsons_episodes", withExtension: "json") else {
            return nil
        }

        guard let data = try? Data(contentsOf: docURL) else {
            return nil
        }

        return data
    }

    func parseDataJSON(jsonData: Data) -> SimpsonsEpisodesModel? {
        let decoder = JSONDecoder()

        do {
            let episodes = try decoder.decode(SimpsonsEpisodesModel.self, from: jsonData)
            return episodes

        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
