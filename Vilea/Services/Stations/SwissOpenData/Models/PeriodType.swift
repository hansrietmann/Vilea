//
//  PeriodType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct PeriodType: Decodable {
    /// The opening time (pattern: Pattern: [0-9]{2}:[0-9]{2})
    let begin: String
    /// The closing time (pattern: Pattern: [0-9]{2}:[0-9]{2})
    let end: String
}
