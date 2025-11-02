//
//  AccessibilityLocationType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum AccessibilityLocationType: String, Decodable {
    /// The charging station is located on the street
    case OnStreet
    /// The Charging Point is located inside a Parking Lot
    case ParkingLot
    /// The Charging Point is located inside a Parking Garage
    case ParkingGarage
    /// The Charging Point is located inside an Underground Parking Garage
    case UndergroundParkingGarage
    case Unspecified
}
