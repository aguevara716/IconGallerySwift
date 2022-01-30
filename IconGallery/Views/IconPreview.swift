//
//  IconPreview.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/29/22.
//

import SwiftUI

struct IconPreview: View {
    var selectedIcon: FontAwesomeIcon
    
    @State private var font: String
    @State private var rotation = 0.0
    @State private var iconSize = 300.0
    @State private var iconColor = Color(red: 0, green: 0, blue: 0, opacity: 1)
    @State private var backgroundColor = Color(red: 1, green: 1, blue: 1, opacity: 1)
    
    init(selectedIcon: FontAwesomeIcon) {
        self.selectedIcon = selectedIcon
        font = selectedIcon.styles[0]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .center, spacing: 0) {
                let fontName = FontNames.getFontNameFromStyle(style: font)
                ZStack {
                    Rectangle().foregroundColor(backgroundColor)
                    Text(String(selectedIcon.unicodeScalar))
                        .font(.custom(fontName, size: iconSize))
                        .rotationEffect(.degrees(rotation))
                        .foregroundColor(iconColor)
                }
                Text(selectedIcon.label).font(.headline)
                Text(fontName).font(.subheadline)
                if (selectedIcon.styles.count > 1) {
                    Picker("Font", selection: $font) {
                        ForEach(selectedIcon.styles, id: \.self) { style in
                            Text(style)
                        }
                    } // Picker
                    .pickerStyle(.segmented)
                } // if
            } // Icon VStack
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Size: \(iconSize)")
                Slider(value: $iconSize, in: 10...300)
            } // Size VStack
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Rotation: \(rotation)")
                Slider(value: $rotation, in: 0...360)
            } // Rotation VStack
            
            VStack(alignment: .leading, spacing: 5) {
                ColorPicker("Icon Color (\(iconColor.hex))", selection: $iconColor)
                ColorPicker("Background Color (\(backgroundColor.hex))", selection: $backgroundColor)
            } // Color VStack
            
            Spacer()
            
        } // VStack
        .padding()
    } // body
}

struct IconPreview_Previews: PreviewProvider {
    static var previews: some View {
        let selectedIcon = ModelData().glyphs["address-book"]!
        IconPreview(selectedIcon: selectedIcon)
    }
}
