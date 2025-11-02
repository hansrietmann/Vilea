//
//  InfoTextType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct InfoTextType: Decodable {
    /// The language in which the additional info text is provided
    let lang: String
    /// The Additional Info text
    let value: String
}
