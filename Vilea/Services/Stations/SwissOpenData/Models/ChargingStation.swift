//
//  ChargingStation.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import CoreLocation

struct ChargingStation: Hashable, Sendable, Identifiable {
    let id: String
    let operatorID: String
    let operatorName: String
    let coordinates: CLLocationCoordinate2D
    let spots: [ChargingSpot]
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(operatorID)
        hasher.combine(operatorName)
    }
}

extension Array where Element == ChargingStation {
    static func makePreviewStations() -> Self {
        [
            ChargingStation(
                id: UUID().uuidString,
                operatorID: UUID().uuidString,
                operatorName: "Operator 1",
                coordinates: CLLocationCoordinate2D(latitude: 47.39652, longitude: 8.44953),
                spots: [
                    ChargingSpot(id: UUID().uuidString, availability: .Available, power: 22),
                    ChargingSpot(id: UUID().uuidString, availability: .Occupied, power: 22),
                    ChargingSpot(id: UUID().uuidString, availability: .OutOfService, power: 42)
                ]
            ),
            ChargingStation(
                id: UUID().uuidString,
                operatorID: UUID().uuidString,
                operatorName: "Operator 2",
                coordinates: CLLocationCoordinate2D(latitude: 47.43094, longitude: 8.56037),
                spots: [
                    ChargingSpot(id: UUID().uuidString, availability: .Available, power: 66),
                    ChargingSpot(id: UUID().uuidString, availability: .Unknown, power: 22)
                ]
            ),
            ChargingStation(
                id: UUID().uuidString,
                operatorID: UUID().uuidString,
                operatorName: "Operator 3",
                coordinates: CLLocationCoordinate2D(latitude: 47.31954, longitude: 8.58141),
                spots: [
                    ChargingSpot(id: UUID().uuidString, availability: .Available, power: 42)
                ]
            )
        ]
    }
}
