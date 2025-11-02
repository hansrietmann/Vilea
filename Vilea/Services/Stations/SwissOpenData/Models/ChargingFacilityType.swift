//
//  ChargingFacilityType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

struct ChargingFacilityType: Decodable {
    /// Charging Facility power type (e.g. AC or DC)
    let powertype: PowerType?
    /// Voltage (Line to Neutral) of the Charging Facility
    let Voltage: SwissOpenDataInt?
    /// Amperage of the Charging Facility
    let Amperage: SwissOpenDataInt?
    /// Charging Facility power in kW
    let power: SwissOpenDataInt?
    /// List of charging modes that are supported.
    let ChargingModes: [ChargingModeType]?
}
