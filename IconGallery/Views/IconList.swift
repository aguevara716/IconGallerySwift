//
//  IconList.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/28/22.
//

import SwiftUI

struct IconList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText: String = ""
    
    var searchResults: [String] {
        if (searchText.isEmpty) {
            return Array(modelData.glyphs.keys.sorted())
        } else {
            return Array(modelData.glyphs.filter {
                $0.key.localizedCaseInsensitiveContains(searchText) ||
                $0.value.label.localizedStandardContains(searchText) ||
                $0.value.search.terms.filter {
                    $0.localizedStandardContains(searchText)
                }.count > 0
            }.keys.sorted())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { key in
                    let icon = modelData.glyphs[key]!
                    NavigationLink {
                        IconDetails(selectedIcon: icon, font: icon.styles[0])
                    } label: {
                        HStack {
                            Text(String(icon.unicodeScalar))
                                .font(.custom(FontNames.getFontNameFromIcon(icon: icon), size: 30))
                            Divider()
                            VStack(alignment: .leading, spacing: 0) {
                                Text(icon.label)
                                HStack(spacing: 2) {
                                    Text(key)
                                    Divider()
                                    Text(icon.stylesString)
                                } // HStack
                                .font(.caption2)
                                    
                            } // VStack
                        } // HStack
                    } // label
                } // ForEach
            } // List
            .listStyle(.inset)
            .searchable(text: $searchText)
            .disableAutocorrection(true)
            .navigationTitle("Icons (\(searchResults.count))")
            
        }
    }
}

struct IconList_Previews: PreviewProvider {
    static var previews: some View {
        IconList()
            .environmentObject(ModelData())
    }
}
