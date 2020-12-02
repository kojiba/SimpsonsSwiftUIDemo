//
//  View+ToAnyView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

extension View {

    @inlinable public func defaultShadow() -> some View {
        shadow(color: Color.label.opacity(0.15), radius: 3, x: 0, y: 2)
    }

    @inlinable public func bottomShadow() -> some View {
        shadow(color: Color.label.opacity(0.17), radius: 15, x: 0, y: -12)
    }
}
