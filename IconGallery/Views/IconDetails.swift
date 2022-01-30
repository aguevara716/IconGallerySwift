//
//  IconDetails.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/29/22.
//

import SwiftUI

struct IconDetails: View {
    var selectedIcon: FontAwesomeIcon
    @State var font: String
    
    var body: some View {
        TabView {
            IconPreview(selectedIcon: selectedIcon)
                .tabItem {
                    Image(systemName: "paintpalette")
                    Text("Color")
                } // tabItem

            IconDetailsTab(selectedIcon: selectedIcon)
            .tabItem {
                Image(systemName: "info.circle")
                Text("Details")
            } // tabItem
        } // TabView
    } // body
}

struct IconDetails_Previews: PreviewProvider {
    static var previews: some View {
        let selectedIcon = ModelData().glyphs.values.first!
        IconDetails(selectedIcon: selectedIcon, font: selectedIcon.styles[0])
    }
}
