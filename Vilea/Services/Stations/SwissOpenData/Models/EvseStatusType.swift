//
//  EvseStatusType.swift
//  Vilea
//
//  Created by Hans Rietmann on 01.11.2025.
//

import Foundation

enum EvseStatusType: String, Decodable {
    /// Charging Spot is available for charging.
    case Available
    /// Charging Spot is reserved and not available for charging.
    case Reserved
    /// Charging Spot is busy.
    case Occupied
    /// Charging Spot is out of service and not available for charging.
    case OutOfService
    /// The requested EvseID and EVSE status does not exist within the Hubject database.
    case EvseNotFound
    /// No status information available.
    case Unknown
}
