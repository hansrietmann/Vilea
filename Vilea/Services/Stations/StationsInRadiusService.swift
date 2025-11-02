//
//  StationsInRadiusService.swift
//  Vilea
//
//  Created by Hans Rietmann on 30.10.2025.
//

import Foundation
import CoreLocation

final class StationsInRadiusService: ChargingStationsProvider {
    private let stationsProvider: ChargingStationsProvider
    
    init(stationsProvider: ChargingStationsProvider) {
        self.stationsProvider = stationsProvider
    }
    
    func chargingStations(arround location: CLLocation?) async throws -> [ChargingStation] {
        let stations = try await stationsProvider.chargingStations(arround: location)
        guard let location else { return stations }
        let region = CLCircularRegion(
            center: location.coordinate,
            radius: 1_000,
            identifier: UUID().uuidString
        )
        return stations.filter { region.contains($0.coordinates) }
    }
}
