//
//  CLLocation+makeZurichLocation.swift
//  Vilea
//
//  Created by Hans Rietmann on 02.11.2025.
//

import CoreLocation

extension CLLocation {
    static func makeZurichLocation() -> CLLocation {
        CLLocation(latitude: 47.37176, longitude: 8.54261)
    }
    static func makeZurichLocations() -> [CLLocation] {
        [
            CLLocation(latitude: 47.38001, longitude: 8.54736),
            CLLocation(latitude: 47.39697, longitude: 8.53723),
            CLLocation(latitude: 47.38256, longitude: 8.52977),
            CLLocation(latitude: 47.36467, longitude: 8.56637),
            CLLocation(latitude: 47.40630, longitude: 8.54721),
            CLLocation(latitude: 47.37178, longitude: 8.52597),
            CLLocation(latitude: 47.38136, longitude: 8.51548),
        ]
    }
}
