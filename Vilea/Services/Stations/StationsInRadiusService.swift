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
        guard let location else { return [] }
        let region = CLCircularRegion(
            center: location.coordinate,
            radius: 1_000,
            identifier: UUID().uuidString
        )
        let stations = try await stationsProvider.chargingStations(arround: location)
        return stations.filter { region.contains($0.coordinates) }
    }
}
