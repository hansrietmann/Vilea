//
//  ValueAddedServiceType.swift
//  Vilea
//
//  Created by Hans Rietmann on 31.10.2025.
//

import Foundation

enum ValueAddedServiceType: String, Decodable {
    /// Can an EV driver reserve the charging sport via remote services?
    case Reservation
    /// Does the EVSE ID support dynamic pricing?
    case DynamicPricing
    /// Is dynamic status info on the parking area in front of the EVSE-ID available?
    case ParkingSensors
    /// Does the EVSE-ID offer a dynamic maximum power charging?
    case MaximumPowerCharging
    /// Is predictive charge Point usage info available for the EVSE-ID?
    case PredictiveChargePointUsage
    /// Does the EVSE-ID offer charging plans, e.g. As described in ISO15118-2?
    case ChargingPlans
    /// Indicates if the charging station is under a roof
    case RoofProvided
    /// There are no value-added services available.
    case None
}
