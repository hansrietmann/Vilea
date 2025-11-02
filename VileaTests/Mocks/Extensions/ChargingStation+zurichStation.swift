//
//  ChargingStation+zurichStation.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//

@testable import Vilea
import CoreLocation

extension ChargingStation {
    static let zurichStation: Self = ChargingStation(
        id: "CH*IOY*E115201",
        operatorID: "",
        operatorName: "",
        coordinates: CLLocationCoordinate2D(latitude: 47.37176, longitude: 8.54261),
        spots: [
            ChargingSpot(id: "", availability: .Unknown, power: nil)
        ]
    )
}
