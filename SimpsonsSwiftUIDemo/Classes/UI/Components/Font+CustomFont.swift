//
//  Font+CustomFont.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

extension Font {
    public static let simpsons = Font.custom("Simpsonfont", size: 24)
}

extension View {
    func simpsonsFont() -> some View {
        self.font(.simpsons)
    }
}

