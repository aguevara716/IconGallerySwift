//
//  ColorExtensions.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/29/22.
//

import SwiftUI

extension Color {
    var hex: String {
        let components = cgColor?.components
        let red = Float((components?[0] ?? 0.0) * 255)
        let green = Float((components?[1] ?? 0.0) * 255)
        let blue = Float((components?[2] ?? 0.0) * 255)
        
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(red), lroundf(green), lroundf(blue))
        return hexString
    }
    
}
