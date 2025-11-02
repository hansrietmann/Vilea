//
//  Array+expectedStationsFromSwissOpenDataFetchResponse.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

@testable import Vilea
import CoreLocation

extension Array where Element == ChargingStation {
    static let expectedStationsFromSwissOpenDataFetchResponse: Self = [
        ChargingStation(
            id: "CH*SWI*E10382",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.37545935, longitude: 7.94404536),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        ChargingStation(
            id: "CH*SWI*E10662",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.188216, longitude: 7.401496),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        ChargingStation(
            id: "e86b4e30-3498-11f0-9cef-42010aa400b8",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.454803, longitude: 8.57952),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        ChargingStation(
            id: "CH*SWI*E168194",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.388118, longitude: 8.752624),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        ChargingStation(
            id: "CH*SWI*E1123",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.72261, longitude: 8.643419),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        ChargingStation(
            id: "f5860f18-5b19-11f0-b0b2-42010aa400b8",
            operatorID: "",
            operatorName: "",
            coordinates: CLLocationCoordinate2D(latitude: 47.556752, longitude: 8.250345),
            spots: [
                ChargingSpot(id: "", availability: .Unknown, power: nil)
            ]
        ),
        .zurichStation,
    ]
    static let expectedStationsNearZurich: Self = [.zurichStation]
    static func makeZurichChargingStations() -> Self {
        CLLocation.makeZurichLocations().map { location in
            ChargingStation(
                id: UUID().uuidString,
                operatorID: UUID().uuidString,
                operatorName: UUID().uuidString,
                coordinates: location.coordinate,
                spots: [
                    ChargingSpot(id: UUID().uuidString, availability: .Available, power: 0),
                    ChargingSpot(id: UUID().uuidString, availability: .Unknown, power: 0),
                    ChargingSpot(id: UUID().uuidString, availability: .Reserved, power: 0),
                ]
            )
        }
    }
}
