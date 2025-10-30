//
//  Locale+mockedArray.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

extension Locale {
    static func mockedArray() -> Array<Locale> {
        [
            Locale(identifier: "de_DE"),
            Locale(identifier: "fr_FR"),
            Locale(identifier: "it_IT"),
            Locale(identifier: "en_US"),
            Locale(identifier: "es_ES")
        ]
    }
}
