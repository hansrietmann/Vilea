//
//  EnvironmentalImpactType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct EnvironmentalImpactType: Decodable {
    /// Total CO2 emited by the energy source being used by this charging station to supply energy to EV. Units are in g/kWh
    let CO2Emission: Double?
    /// Total NuclearWaste emited by the energy source being used by this charging station to supply energy to EV. Units are in g/kWh
    let NuclearWaste: Double?
}
