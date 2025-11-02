//
//  EnergySourceType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct EnergySourceType: Decodable {
    let Energy: EnergyType?
    /// Percentage of EnergyType being used by the charging stations
    let Percentage: Int?
}
