//
//  StationModel.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import CoreLocation

struct StationModel: Equatable, Sendable {
    let id: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
