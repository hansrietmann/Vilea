//
//  SwissOpenDataArray.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

/// Decodes either a single object or an array of objects into an array.
struct SwissOpenDataArray<Element>: Decodable where Element: Decodable {
    let value: [Element]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let array = try? container.decode([Element].self) {
            self.value = array
            return
        }
        let single = try container.decode(Element.self)
        self.value = [single]
    }
}
