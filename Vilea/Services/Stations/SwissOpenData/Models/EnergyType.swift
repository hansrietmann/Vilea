//
//  EnergyType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum EnergyType: String, Decodable {
    /// Energy coming from Solar radiation
    case Solar
    /// Energy produced by wind
    case Wind
    /// Energy produced by the movement of water
    case HydroPower
    /// Energy coming from the sub-surface of the earth
    case GeothermalEnergy
    /// Energy produced using plant or animal material as fuel
    case Biomass
    /// Energy produced using coal as fuel
    case Coal
    /// Energy being produced by nuclear fission
    case NuclearEnergy
    /// Energy produced by using Petroleum as fuel
    case Petroleum
    /// Energy produced using Natural Gas as fuel
    case NaturalGas
}
