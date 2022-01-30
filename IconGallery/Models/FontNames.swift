//
//  FontNames.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/28/22.
//

import Foundation

struct FontNames {
    public static let fontAwesomeBrands = "Font Awesome 5 Brands"
    public static let fontAwesomeRegular = "Font Awesome 5 Free Regular"
    public static let fontAwesomeSolid = "Font Awesome 5 Free Solid"
    
    public static func getFontNameFromIcon(icon: FontAwesomeIcon) -> String {
        return getFontNameFromStyles(styles: icon.styles)
    }
    
    public static func getFontNameFromStyles(styles: [String]) -> String {
        return getFontNameFromStyle(style: styles[0])
    }
    
    public static func getFontNameFromStyle(style: String) -> String {
        switch style {
            case "brands":
                return FontNames.fontAwesomeBrands
            case "regular":
                return FontNames.fontAwesomeRegular
            case "solid":
                return FontNames.fontAwesomeSolid
            default:
                return FontNames.fontAwesomeSolid
        }
    }
    
}
