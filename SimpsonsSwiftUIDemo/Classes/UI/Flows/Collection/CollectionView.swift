//
//  CollectionView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        Text("Hello, World!")
            .simpsonsFont()
            .onAppear(perform: loadData)
    }

    func loadData() {
        let manager = DataManager.shared

        guard let data = manager.loadJSONData() else {
            return
        }

        guard let episodes = manager.parseDataJSON(jsonData: data) else {
            return
        }

        print(episodes.episodes)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
