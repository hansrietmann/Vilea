//
//  SwissOpenDataDouble.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

/// A wrapper that decodes a Double from Double, Int, String, or numeric-String (e.g., "1", "1.0").
struct SwissOpenDataDouble: Decodable {
    let value: Double
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let doubleVal = try? container.decode(Double.self) {
            self.value = doubleVal
            return
        }
        if let intVal = try? container.decode(Int.self) {
            self.value = Double(intVal)
            return
        }
        if let stringVal = try? container.decode(String.self) {
            let trimmed = stringVal.trimmingCharacters(in: .whitespacesAndNewlines)
            if let d = Double(trimmed) {
                self.value = d
                return
            }
        }
        throw DecodingError.typeMismatch(Double.self, .init(codingPath: decoder.codingPath, debugDescription: "Expected to decode Double from Double/Int/String"))
    }
}