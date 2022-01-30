//
//  FontAwesomeIcon.swift
//  Playground
//
//  Created by Angel Guevara, Jr. on 1/28/22.
//

import Foundation

struct FontAwesomeIcon : Codable, Hashable {
    let changes: [String]
    let ligatures: [String]
    let search: Search
    let styles: [String]
    let unicode: String
    let label: String
    let voted: Bool?
    let svg: [String:Svg]
    let free: [String]
    
    var cssClass: String?
    
    var changesString: String {
        changes.joined(separator: ", ")
    }
    
    var freeString: String {
        free.joined(separator: ", ")
    }
    
    var ligaturesString: String {
        ligatures.joined(separator: ", ")
    }
    
    var searchTermsString: String {
        search.terms.joined(separator: ", ")
    }
    
    var stylesString: String {
        styles.joined(separator: ", ")
    }
    
    var unicodeScalar: UnicodeScalar {
        Unicode.Scalar(Int(unicode, radix: 16) ?? 0)!
    }
}

struct Search : Codable, Hashable {
    let terms: [String]
}

struct Svg : Codable, Hashable {
    let last_modified: Int
    let raw: String
    let viewBox: [String]
    let width: Int
    let height: Int
    let path: String
    
    var lastModifiedDate: Date {
        Date(timeIntervalSince1970: Double(last_modified / 1000))
    }
    
    var sizeString: String {
        "\(width) \u{00d7} \(height)" // 00d7 --> &times;
    }
    
    var viewBoxString: String {
        viewBox.joined(separator: ", ")
    }
}
