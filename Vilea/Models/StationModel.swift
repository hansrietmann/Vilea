//
//  StationModel.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import CoreLocation

struct StationModel: Equatable, Sendable, Identifiable {
    let id: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}


extension Array where Element == StationModel {
    static func makePreviewStations() -> Self {
        [
            StationModel(
                id: "CH*SWI*E10382",
                coordinate: CLLocationCoordinate2D(latitude: 7.94404536, longitude: 47.37545935)
            ),
            StationModel(
                id: "CH*SWI*E10662",
                coordinate: CLLocationCoordinate2D(latitude: 7.401496, longitude: 47.188216)
            ),
            StationModel(
                id: "e86b4e30-3498-11f0-9cef-42010aa400b8",
                coordinate: CLLocationCoordinate2D(latitude: 8.57952, longitude: 47.454803)
            ),
            StationModel(
                id: "CH*SWI*E168194",
                coordinate: CLLocationCoordinate2D(latitude: 8.752624, longitude: 47.388118)
            ),
            StationModel(
                id: "CH*SWI*E1123",
                coordinate: CLLocationCoordinate2D(latitude: 8.643419, longitude: 47.72261)
            ),
            StationModel(
                id: "f5860f18-5b19-11f0-b0b2-42010aa400b8",
                coordinate: CLLocationCoordinate2D(latitude: 8.250345, longitude: 47.556752)
            ),
        ]
    }
}
