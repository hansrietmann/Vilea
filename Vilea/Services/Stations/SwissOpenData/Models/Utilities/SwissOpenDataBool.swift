//
//  SwissOpenDataBool.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//


import Foundation

/// A wrapper that decodes a Bool from Bool, Int(0/1), or common truthy/falsey strings ("true","false","1","0","yes","no").
struct SwissOpenDataBool: Decodable {
    let value: Bool
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let boolVal = try? container.decode(Bool.self) {
            self.value = boolVal
            return
        }
        if let intVal = try? container.decode(Int.self) {
            self.value = (intVal != 0)
            return
        }
        if let stringVal = try? container.decode(String.self) {
            switch stringVal.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
            case "true", "1", "yes", "y": self.value = true; return
            case "false", "0", "no", "n": self.value = false; return
            default: break
            }
        }
        throw DecodingError.typeMismatch(Bool.self, .init(codingPath: decoder.codingPath, debugDescription: "Expected to decode Bool from Bool/Int/String"))
    }
}