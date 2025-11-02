//
//  ChargingStationsProvider.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation
import CoreLocation

protocol ChargingStationsProvider {
    func chargingStations(arround location: CLLocation?) async throws -> [ChargingStation]
}
