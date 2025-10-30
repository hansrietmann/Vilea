//
//  Data+asObject.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation

extension Data {
    func asObject<T>() throws -> T where T: Decodable {
        try JSONDecoder().decode(T.self, from: self)
    }
}
