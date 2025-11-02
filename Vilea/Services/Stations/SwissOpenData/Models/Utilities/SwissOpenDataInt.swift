//
//  SwissOpenDataInt.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

/// A wrapper that decodes an Int from Int, Double, String, or numeric-String (e.g., "1", "1.0").
struct SwissOpenDataInt: Decodable {
    let value: Int
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        // Try direct Int
        if let intVal = try? container.decode(Int.self) {
            self.value = intVal
            return
        }
        // Try Double (e.g., 1.0)
        if let doubleVal = try? container.decode(Double.self) {
            self.value = Int(doubleVal.rounded())
            return
        }
        // Try String -> Int or Double-string
        if let stringVal = try? container.decode(String.self) {
            if let intFromString = Int(stringVal.trimmingCharacters(in: .whitespacesAndNewlines)) {
                self.value = intFromString
                return
            }
            if let doubleFromString = Double(stringVal.trimmingCharacters(in: .whitespacesAndNewlines)) {
                self.value = Int(doubleFromString.rounded())
                return
            }
        }
        throw DecodingError.typeMismatch(Int.self, .init(codingPath: decoder.codingPath, debugDescription: "Expected to decode Int from Int/Double/String"))
    }
}