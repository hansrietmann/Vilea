//
//  JSONFile.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

struct JSONFile {
    private final class BundleToken {}
    
    let data: Data
    
    private init(filename: String) throws {
        let bundle = Bundle(for: BundleToken.self)
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("No JSON file named '\(filename)' found")
        }
        data = try Data(contentsOf: url)
    }
    
    static var swissOpenDataStationsResponse: JSONFile {
        try! JSONFile(filename: "ch.bfe.ladestellen-elektromobilitaet_en")
    }
}
