//
//  Font+CustomFont.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct AsyncImage: View {
    @ObservedObject private var loader: ImageLoader

    init(urlString: String, cache: ImageCache = ImageCache.shared) {
        self.init(url: URL(string: urlString), cache: cache)
    }

    init(url: URL?, cache: ImageCache = ImageCache.shared) {
        loader = ImageLoader(url: url, cache: cache)
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ActivityIndicator(isAnimating: .constant(true), style: .medium, color: .systemGray)
            }
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(urlString: "http://static-media.fxx.com/img/FX_Networks_-_FXX/684/590/Simpsons_05_10.jpg")
    }
}