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
            
            Spacer(minLength: 8)
            
            Text(item.value)
        }
            .simpsonsFont()
    }
}

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(item: DetailItemViewModel(title: "Title", value: "Value"))
    }
}
