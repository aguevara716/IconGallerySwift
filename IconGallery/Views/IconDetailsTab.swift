//
//  IconDetailsTab.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/29/22.
//

import SwiftUI

struct IconDetailsTab: View {
    let selectedIcon: FontAwesomeIcon
    
    var body: some View {
        List {
            Section(header: Text("Icon")) {
                HStack(alignment: .center) {
                    ForEach(selectedIcon.styles, id: \.self) { style in
                        VStack {
                            Text(String(selectedIcon.unicodeScalar))
                                .font(.custom(FontNames.getFontNameFromStyle(style: style), size: 50))
                            Text(style)
                                .font(.caption2)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            
            Section(header: Text("Info")) {
                HStack {
                    Text("Changes").bold()
                    Divider()
                    Text(selectedIcon.changesString)
                }
                HStack {
                    Text("CSS Class").bold()
                    Divider()
                    Text(selectedIcon.cssClass ?? "NULL")
                }
                HStack {
                    Text("Free").bold()
                    Divider()
                    Text(selectedIcon.freeString)
                }
                HStack {
                    Text("Label").bold()
                    Divider()
                    Text(selectedIcon.label)
                }
                HStack {
                    Text("Ligatures").bold()
                    Divider()
                    Text(selectedIcon.ligaturesString)
                }
                HStack {
                    Text("Search Terms").bold()
                    Divider()
                    Text(selectedIcon.searchTermsString)
                }
                HStack {
                    Text("Styles").bold()
                    Divider()
                    Text(selectedIcon.stylesString)
                }
                HStack {
                    Text("Unicode").bold()
                    Divider()
                    Text(selectedIcon.unicode.uppercased())
                }
                HStack {
                    Text("Voted").bold()
                    Divider()
                    Text(String(selectedIcon.voted ?? false))
                }
            } // Section
            ForEach(Array(selectedIcon.svg.keys), id: \.self) { key in
                let svg = selectedIcon.svg[key]!
                Section(header: Text(key)) {
                    HStack {
                        Text("Last Modified").bold()
                        Divider()
                        Text(svg.lastModifiedDate.formatted())
                    }
                    HStack {
                        Text("Size").bold()
                        Divider()
                        Text(svg.sizeString)
                    }
                    HStack {
                        Text("ViewBox").bold()
                        Divider()
                        Text(svg.viewBoxString)
                    }
                } // Section
            } // ForEach
        } // List
    } // body
}

struct IconDetailsTab_Previews: PreviewProvider {
    static var previews: some View {
        IconDetailsTab(selectedIcon: ModelData().glyphs.values.first!)
    }
}
