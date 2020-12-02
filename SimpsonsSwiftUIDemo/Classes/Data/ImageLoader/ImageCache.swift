//
//  ImageCache.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import UIKit

class ImageCache: ObservableObject {
    private let cache = NSCache<NSURL, UIImage>()

    subscript(_ key: URL) -> UIImage? {
        get {
            cache.object(forKey: key as NSURL)
        }

        set {
            if let value = newValue {
                cache.setObject(value, forKey: key as NSURL)
            } else {
                cache.removeObject(forKey: key as NSURL)
            }
        }
    }
}