//
//  View+ToAnyView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

extension String: Identifiable {
    public var id: String {
        self
    }
}