//
//  DetailItemView.swift
//  SimpsonsSwiftUIDemo
//
//  Created by kojiba on 02.12.2020.
//  Copyright © 2020 kojiba. All rights reserved.
//

import SwiftUI

struct DetailItemView: View {
    @State var item: DetailItemViewModel
    
    var body: some View {
        HStack {
            Text(item.title)
                .minimumScaleFactor(0.7)
            
            Spacer(minLength: .spacing)
            
            Text(item.value)
                .minimumScaleFactor(0.5)
        }
            .simpsonsFont()
            .foregroundColor(.label)
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(item: DetailItemViewModel(title: "Title", value: "Value"))
    }
}
