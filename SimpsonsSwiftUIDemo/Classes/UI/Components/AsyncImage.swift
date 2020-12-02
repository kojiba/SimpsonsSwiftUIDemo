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
        VStack {
            stateView()
        }
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private func stateView() -> AnyView {
        if let image = loader.image {
            return Image(uiImage: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .toAnyView()
            
        } else {
            return ActivityIndicator(isAnimating: .constant(true), style: .medium, color: .systemGray)
                .toAnyView()
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(urlString: "http://static-media.fxx.com/img/FX_Networks_-_FXX/684/590/Simpsons_05_10.jpg")
    }
}